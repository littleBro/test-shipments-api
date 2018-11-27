# Test shipments api

To launch all the things, if docker and docker-compose are installed:

`SOLUTION=rails docker-compose run tester`

The options for SOLUTION are:
- `rails`
- `sinatra` (coming soon)
- `phoenix` (coming soon)

Of course, the `.env` file should not be put at Git, but I did it for convenience.

## Rails solution

Learning Ruby on Rails, I tried to follow the Rails way, mostly using the capabilities of the framework itself, rather than reinventing the wheel.

For json rendering I chose [Jbuilder](https://github.com/rails/jbuilder) for these reasons:

1. It's a native Rails solution, and it lets to keep the controllers lean
2. Its templating syntax is straightforward and powerful

I've also used the gems [has_scope](https://github.com/plataformatec/has_scope) for filtering and [kaminari](https://github.com/kaminari/kaminari) for pagination.
