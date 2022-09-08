from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="home"),
    path("home/", views.home, name="home"),
    path("about/", views.about, name="about"),
    path('search_results/', views.search_results, name='search_results'),
    path('<int:prop_id>/', views.property, name='property'),
    path('make_offer/', views.make_offer, name='make_offer'),
    path('user_offer/', views.user_offer, name='user_offer'),
    path('edit_offer/<int:prop_id>/', views.edit_offer, name='edit_offer'),
    path('delete_offer/<int:prop_id>', views.delete_offer, name='delete_offer'),
    path('contact/<int:message_recipient>/<int:prop_id>', views.contact, name='contact'),
]