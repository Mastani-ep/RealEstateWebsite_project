from django.shortcuts import render
from django.shortcuts import redirect, get_object_or_404
from django.contrib.auth.models import User
from django.views.generic import CreateView
from .models import Property, Agent
from django.http import HttpResponse
from .forms import AddProperty, SearchProperties, Contact
from django.core.mail import send_mail
# Create your views here.


def index(response):
    return render(response, "estatesite/base.html", {})


def home(request):
    form = SearchProperties
    return render(request, "estatesite/home.html", {'form': form})


def about(request):
    return render(request, "estatesite/about.html")


def search_results(request):
    if request.method == "POST":
        properties = Property.objects.filter(is_published=True)
        properties = properties.order_by('-date')
        if 'type' in request.POST and request.POST['type'] !='':
            type = request.POST['type']
            properties = properties.filter(type__iexact=type)
        if 'transaction' in request.POST and request.POST['transaction'] !='':
            transaction = request.POST['transaction']
            properties = properties.filter(transaction__iexact=transaction)
        if 'address' in request.POST:
            address = request.POST['address']
            properties = properties.filter(address__icontains=address)
        if 'keyword' in request.POST:
            keyword = request.POST['keyword']
            properties = properties.filter(description__icontains=keyword)
        if 'price_from' in request.POST and request.POST['price_from'] !='':
            price_from = request.POST['price_from']
            properties = properties.filter(price__gte=price_from)
        if 'price_to' in request.POST and request.POST['price_to'] !='':
            price_to = request.POST['price_to']
            properties = properties.filter(price__lte=price_to)
        if 'size_from' in request.POST and request.POST['size_from'] !='':
            m2_from = request.POST['size_from']
            properties = properties.filter(size__gte=m2_from)
        if 'size_to' in request.POST and request.POST['size_to'] !='':
            m2_to = request.POST['size_to']
            properties = properties.filter(size__lte=m2_to)
        if 'rooms_from' in request.POST and request.POST['rooms_from'] !='':
            rooms_from = request.POST['rooms_from']
            properties = properties.filter(rooms__gte=rooms_from)
        if 'rooms_to' in request.POST and request.POST['rooms_to'] !='':
            rooms_to = request.POST['rooms_to']
            properties = properties.filter(rooms__lte=rooms_to)
        if 'bathrooms_from' in request.POST and request.POST['bathrooms_from'] !='':
            bathrooms_from = request.POST['bathrooms_from']
            properties = properties.filter(bathrooms__gte=bathrooms_from)
        if 'bathrooms_to' in request.POST and request.POST['bathrooms_to'] !='':
            bathrooms_to = request.POST['bathrooms_to']
            properties = properties.filter(bathrooms__lte=bathrooms_to)
        return render(request, "estatesite/search_results.html", {'properties': properties})
    else:
        return render(request, 'estatesite/home.html', {})


def make_offer(request):
    not_login = False
    form = AddProperty
    submitted = False
    if request.user.is_authenticated:
        if request.method == 'POST':
            form = AddProperty(request.POST, request.FILES)
            if form.is_valid():
                Property = form.save(commit=False)
                Property.user = request.user
                Property.save()
                return redirect('/make_offer?submitted=True')
        else:
            if 'submitted' in request.GET:
                submitted = True
    else:
        not_login = True
    return render(request, "estatesite/make_offer.html", {'form': form, 'submitted': submitted, 'not_login': not_login})



def user_offer(request):
    if request.user.is_authenticated:
        form = Contact(initial={'message_email': request.user.email,
                                'message_name': request.user.first_name + ' ' + request.user.last_name})
        if request.user.groups.filter(name="Agents").exists():
            properties = Property.objects.filter(agent__user=request.user)
        else:
            properties = Property.objects.filter(user=request.user)
        properties = properties.order_by('-date')
        return render(request, 'estatesite/user_offer.html', {'properties': properties, 'form': form})
    else:
        return redirect('/home')


def property(request, prop_id):
    property = get_object_or_404(Property, pk=prop_id)
    if property.is_published or property.user == request.user or property.agent.user == request.user:
        if request.user.is_authenticated:
            form = Contact(initial={'message_email': request.user.email,
                                'message_name': request.user.first_name + ' ' + request.user.last_name})
        else:
            form = Contact
        return render(request, 'estatesite/prop.html', {'property': property, 'form': form})
    else:
        return redirect('/home')


def edit_offer(request, prop_id):
    property = get_object_or_404(Property, pk=prop_id)
    edited = False
    if property.user == request.user or property.agent.user == request.user:
        form = AddProperty(request.POST or None, instance=property)
        if form.is_valid():
            form.save()
            return redirect(f'/edit_offer/{prop_id}?edited=True')
        if 'edited' in request.GET:
            edited = True
        return render(request, 'estatesite/edit_property.html', {'property': property, 'form': form, 'edited': edited})
    else:
        return redirect('/home')


def delete_offer(request, prop_id):
    property = Property.objects.get(id=prop_id)
    if (property.user == request.user and not property.is_published) or property.agent.user == request.user:
        property.delete()
        return render(request, 'estatesite/delete_offer.html')
    else:
        return redirect('/home')


def contact(request, message_recipient, prop_id):
    if request.method == 'POST':
        message_name = request.POST['message_name']
        message_email_from = request.POST['message_email']
        message_text = request.POST['message_text']
        property = Property.objects.get(id=prop_id)
        message_email_to = User.objects.get(id=message_recipient)
        message_email_to = message_email_to.email

        send_mail(
            'From: ' + message_name + ", regarding: " + property.title + " ,exact_id: " + str(property.id),
            message_text +"\nSender's email: " + message_email_from,
            message_email_from,
            [message_email_to],
        )
        return render(request, 'estatesite/contact.html', {'property_id': property.id})
    else:
        return redirect('/home')

