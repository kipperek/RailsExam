
[![Build Status](https://magnum.travis-ci.com/kipperek/RailsExam.svg?token=GoDu5VzyqcjAPGUVXVHu)](https://magnum.travis-ci.com/kipperek/RailsExam)
RailsExam
=========

  Team:
  
    Kacper Czechowicz;
    Partyk Ławicki;
    Marcin Ossowski;
    Jakub Plenis;



Gemy które dodaliśmy:

	gem bootstrap-sass
	gem kaminari
	gem bootstrap-kaminari-views
	gem pygments.rb
	gem omniauth-github
	gem rspec-rails
	gem shelly
	gem factory_girl_rails
	gem pg
	gem shelly-dependencies

Stworzyliśmy testy dla:
	
	routing
	models
	controllers
	views
	
	
Zadania, które udało nam się wykonać:

	Wygląd strony przy użyciu bootstrapa
	Wyszukiwanie gistów i postów
	Generatory dla gistów i postów
	Walidacja danych w formularzu
	Kolorowanie gistów
	Logowanie przez Githuba
	Podlaczenie repozytorium z Travisem
	Użytkownik może zobaczyć swoje jak i wszystkie gisty/posty
	Dodanie Administratora
	Nadanie praw na CRUD użytkownikowi zalogowanemu
	Gość może tylko oglądać posty/gisty
	Aplikacjia posiada 3 modele:gist,post,user
	
	
Aby aplikacja pobrana z githuba dzialała poprawnie 
musimy exportować dwa klucze do githuba poleceniem:

export GITHUB_SECRET=a7b3ee878d2ce07375debe7c0265a367445ea76d

export GITHUB_KEY=41810262d4ccdbd905dc 

Aplikacja została udostępniona na Shelly Cloud:

http://clopteam.shellyapp.com/
