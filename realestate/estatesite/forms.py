from django import forms
from .models import Property
from django.forms import ModelForm


class CreateNewAccount(forms.Form):
    pass


class SearchProperties(forms.Form):
    RENTAL = 'rental'
    SALE = 'sale'
    APARTMENT = 'apartment'
    HOUSE = 'house'
    TRANSACTION = [
        (RENTAL, ('For rent')),
        (SALE, ('For sale')),
    ]

    TYPE = [
        (APARTMENT, ('Apartment')),
        (HOUSE, ('House')),
    ]

    type = forms.ChoiceField(choices=TYPE, widget=forms.Select(attrs={'class': 'form-control'}), required=False)
    transaction = forms.ChoiceField(choices=TRANSACTION, widget=forms.Select(attrs={'class': 'form-control'}), required=False)
    address = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'maxlength': '200',
                                              'placeholder': 'Address of the property'}), required=False)
    price_from = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control', 'min': '0',
                                                                    'placeholder': 'Price from'}), required=False)
    price_to = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control', 'min': '0',
                                                                  'placeholder': 'Price to'}), required=False)
    size_from = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control', 'min': '0',
                                                                   'placeholder': 'Size from'}), required=False)
    size_to = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control', 'min': '0',
                                                                   'placeholder': 'Size to'}), required=False)
    rooms_from = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control', 'min': '0', 'max': '10',
                                                                    'step': '1', 'placeholder': 'Bedrooms from'}), required=False)
    rooms_to = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control', 'min': '0', 'max': '10',
                                                                  'step': '1', 'placeholder': 'Bedrooms to'}), required=False)
    bathrooms_from = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control', 'min': '0', 'max': '10',
                                                                    'step': '1', 'placeholder': 'Bathrooms from'}),required=False)
    bathrooms_to = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control', 'min': '0', 'max': '10',
                                                                  'step': '1', 'placeholder': 'Bathrooms to'}), required=False)
    keyword = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'maxlength': '50',
                                                             'placeholder': 'Keywords'}), required=False)


class AddProperty(ModelForm):
    class Meta:
        model = Property
        fields = ['title', 'type', 'transaction', 'address', 'price', 'size', 'rooms', 'bathrooms', 'garage',
                  'description', 'photo', 'photo_1', 'photo_2', 'photo_3', 'photo_4', 'photo_5', 'photo_6', 'is_published']

        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control', 'maxlength': '200',
                                            'placeholder': 'Title of your offer'}),
            'type': forms.Select(attrs={'class': 'form-control'}),
            "transaction": forms.Select(attrs={'class': 'form-control'}),
            'address': forms.TextInput(attrs={'class': 'form-control', 'maxlength': '200',
                                              'placeholder': 'Address of the property'}),
            'price': forms.NumberInput(attrs={'class': 'form-control', 'min': '0', 'placeholder': 'Estimated price'}),
            'size': forms.NumberInput(attrs={'class': 'form-control', 'min': '0', 'placeholder': 'Size of the property'}),
            'rooms': forms.NumberInput(attrs={'class': 'form-control', 'max': '10', 'min': '1', 'step': '1',
                                              'placeholder': 'Number of bedrooms'}),
            'bathrooms': forms.NumberInput(attrs={'class': 'form-control', 'max': '10', 'min': '1', 'step': '1',
                                                  'placeholder': 'Number of bathrooms'}),
            'garage': forms.NumberInput(attrs={'class': 'form-control', 'max': '10', 'min': '0', 'step': '1',
                                               'placeholder': 'Number of garages'}),
            'description': forms.Textarea(attrs={'class': 'form-control', 'maxlength': '1000',
                                                 'placeholder': 'Description/Additional information'}),
            'is_published': forms.CheckboxInput(attrs={'class': 'form-control'})
        }


class Contact(forms.Form):
    message_name = forms.CharField(label='Your name', required=True, max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    message_email = forms.EmailField(label="Your email", required=True, widget=forms.EmailInput(attrs={'class': 'form-control'}))
    message_text = forms.CharField(label="Your message", required=True, widget=forms.Textarea(attrs={'class':'form-control', 'maxlength': 500}))
