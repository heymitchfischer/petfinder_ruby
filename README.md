# Petfinder_Ruby

Test Gem that assists with interacting with the Petfinder REST API. For a more robust gem, see [here](https://github.com/ehutzelman/petfinder).

## Installation

To install to a gemfile:

```ruby
gem 'petfinder_ruby'
```

And then bundle:

```bash
bundle
```

Or to install manually:

```bash
gem install petfinder_ruby
```

## Rails Configuration

Create a file in your config/initializers directory:

```ruby
# config/initializers/petfinder_ruby.rb
Petfinder.configure do |config|
  config.client_id = "your_client_id"
  config.client_secret = "your_client_secret"
end
```

This will configure Petfinder using your client ID and client secret (both of which can be obtained [here](https://www.petfinder.com/developers/). It's recommended to secure your client ID and client secret by hiding them as environment variables. See the [Figaro Gem](https://github.com/laserlemon/figaro) for assistance with that.

## Usage

Gem currently supports two different requests for the Petfinder API.

Get Organization Info:

```ruby
Petfinder::Client.get_organization("your_org_id")
```

Get Adoptable Animals from an organization:

```ruby
Petfinder::Client.get_adoptable_animals_by_organization("your_org_id")
```