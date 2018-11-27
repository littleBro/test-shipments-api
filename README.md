Shipments API
=============

This test challenge consists of making a REST api endpoint with some relations, computed fields, filtering and pagination.

Being a Python Backend developer, I decided to learn something new and get familiar with the Ruby ecosystem. So, I did it with Ruby on Rails, planning to add Sinatra and Elixir / Phoenix solutions later.

I have dockerized the tester and made it wait for the solution server chosen by user.

The full challenge description can be found at the bottom of this page.

Launching the tests
-------------------

To launch all the things, if docker and docker-compose are installed:

`SOLUTION=rails docker-compose run tester`

The options for SOLUTION are:
- `rails`
- `sinatra` (coming soon)
- `phoenix` (coming soon)

Of course, the `.env` file should not be put at Git, but I did it for convenience.

Solution: Ruby on Rails
-----------------------

Learning Ruby on Rails, I tried to follow the Rails way, mostly using the capabilities of the framework itself, rather than reinventing the wheel.

For json rendering I chose [Jbuilder](https://github.com/rails/jbuilder) for these reasons:

1. It's a native Rails solution, and it lets to keep the controllers lean
2. Its templating syntax is straightforward and powerful

I've also used the gems [has_scope](https://github.com/plataformatec/has_scope) for filtering and [kaminari](https://github.com/kaminari/kaminari) for pagination.

Solution: Sinatra
-----------------

Coming soon...

Solution: Phoenix
-----------------

Coming soon...


glexport-test
=============

**glexport-test** is the backend focused take home interview project for Flexport Engineering.

Given a database with already seeded tables and data, please create a database-backed web application server that responds to a URL and returns json. More specifically, your web server will respond to the `GET index` endpoint `/api/v1/shipments` and return data according to the specification as described in `api/v1/shipments_spec.rb`

The Flexport backend is written in Ruby on Rails, and while its influence is obvious, this project is designed to be language and framework agnostic. Your web server can be written in Python with Django/Flask, Javascript with Node+Express, or something more exotic. The tests are written in rspec+Ruby, but should be very readable even if you don't know any Ruby: All they do is ping a URL and inspect the json response.

Instructions
------------

1. Read the rest of this README and review `api/v1/shipments_spec.rb` to understand the endpoint requirements
2. Create your sample application, using the database dump `glexport_development`
3. Perform the following one time setup steps to get the spec runner working
  1. Navigate to the project root
  2. Modify `spec/config.rb` if necessary
  3. Install ruby if necessary
  4. Install the `bundler` gem if necessary
  5. Run `bundle install`
  6. Make sure your application server is running
4. Run `bundle exec rspec` until specs pass

What we're looking for
----------------------

We'd like you to strike a balance between maintainability and speed, with a mild preference towards maintainability. (After all, we've got to read this code to judge it)

Don't worry too much about where it falls in the spectrum though; it's more important that when we talk about your code that you recognize the tradeoffs you made and what you can cut/add if asked to move in either direction.

In particular, if there's a (well respected) library or framework that you would like to use as part of your implementation, please use it. We're here to make working software that accommodates (some frankly insane) business logic, not to reimplement bcrypt.

The rspec test
--------------

After resetting the database, the [rspec test](https://github.com/flexport/glexport-test/blob/master/spec/api/v1/shipments_spec.rb) pings `GET /api/v1/shipments` with various parameters and examines the json response. The spec can be split out five sections:
- Examining the contents of the json for a single record
- Sorting
- Filtering
- Pagination
- Error Handling

The desired output as defined in the "contents of a single record" section deliberately contains some questionable implementation choices. Please accommodate the desired output and we can discuss the pros and cons of the given json structure.

The Database and Schema
-----------------------

The sample database provided consists of four tables:
- companies
- shipments
- products
- shipment_products

A company has no association columns.

Both shipments and products have a `company_id` (belong to a company).

The shipment_products table is a join table that connects shipments and products, and thus has both a `product_id` and `company_id`.

```
glexport_development=# \d+ companies
Table "public.companies"
   Column   |            Type
------------+-----------------------------
 id         | integer
 name       | character varying
 created_at | timestamp without time zone
 updated_at | timestamp without time zone

glexport_development=# \d+ shipments
Table "public.shipments"
              Column               |            Type
-----------------------------------+-----------------------------
 id                                | integer
 name                              | character varying
 company_id                        | integer
 international_transportation_mode | character varying
 international_departure_date      | date
 created_at                        | timestamp without time zone
 updated_at                        | timestamp without time zone

glexport_development=# \d+ products
Table "public.products"
   Column    |            Type
-------------+-----------------------------
 id          | integer
 sku         | character varying
 description | character varying
 company_id  | integer
 created_at  | timestamp without time zone
 updated_at  | timestamp without time zone

glexport_development=# \d+ shipment_products
Table "public.shipment_products"
   Column    |            Type
-------------+-----------------------------
 id          | integer
 product_id  | integer
 shipment_id | integer
 quantity    | integer
 created_at  | timestamp without time zone
 updated_at  | timestamp without time zone
```
