"""WSProject1 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from app import views

app_name = 'anin3'

urlpatterns = [
    path('', views.homePage),
    path('',views.homePage),
    path('admin/', admin.site.urls),
    path('anime/random/', views.randomAnime, name="randomAnime"),
    path('anime/<str:title>/', views.animeTitle, name="animeTitle"),
    path('voiceactor/<str:nome>/', views.voiceActor, name="voiceActor"),
    path('genre/<str:genre>/', views.animeByGenre, name="genreTitle"),
    path('search/', views.searchByName, name="searchByName"),
    path('allgenres/', views.getGenres, name="getGenres"),
    path('insert/', views.insertData, name="insertData"),
    path('allcharacter/', views.characters, name="getCharacters")

]
