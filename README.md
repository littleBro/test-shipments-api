Pour tout lancer, si docker et docker-compose sont installés :

`SOLUTION=rails docker-compose run tester`

Les options pour SOLUTION sont `rails`, `sinatra` et `phoenix`.

Bien sûr, le fichier `.env` ne doit pas être mis sur Git, mais je l'ai fait pour simplicité.

## Rails solution

J'ai essayé de suivre le "Rails way" au maximum, en utilisant l'intélligence de ActiveRecord, de Action Controller et du moteur des views.

Pour rendre le json, j'ai choisi `Jbuilder` pour ces raisons :

1. C'est la solution native qui utilise les conventions de Ruby on Rails pour les views, donc le code reste minimaliste 
2. Son syntaxe de templating est straightforward et puissant

J'ai aussi utilisé les gems `has_scope` for filtering et `kaminari` for pagination.