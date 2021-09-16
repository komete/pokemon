# README

* Database initialization

  To run the database migration:

        rails db:migrate

  To load the database with the provided pokemons run:

        rails pokemons:transactions

* Run the server

        rails server

* Run the unit tests

        rails test

* Pokemons Rest API

  The data format is JSON only.

  GET /pokemons : Return all pokemons.

  GET /pokemons/:id(.:format) : Return the specific pokemon.

  POST /pokemons(.:format)

  PUT /pokemons/:id(.:format)

  DELETE /pokemons/:id(.:format)
