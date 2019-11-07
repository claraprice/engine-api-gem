# Engine API Gem

Welcome! This application is a Ruby gem which provides a framework for interacting with the [Engine API](https://github.com/claraprice/engine-api).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'service_data_engine'
```

And then execute:
```shell
bundle
```

Or install it yourself as:
```shell
gem install service_data_engine
```

## Dependencies and Gotchas
- This application requires environment variables to connect with the [Engine API](https://github.com/claraprice/engine-api) service.

## Env Vars
Copy/paste the following into the your local `.env` file. Staging and Production values can be found on the appropriate servers.
```env
ENGINE_API_SECRET
ENGINE_API_TOKEN
ENGINE_BASE_URL="https://engine-staging.claraprice.com/resources/v36/"
```

## Usage

The easiest setup is to create a new file within `config/initializers` called `engine-api.rb`.
```ruby
ENGINE_API = ServiceDataEngine::Api.new

# now you can call ENGINE_API anywhere you want
drg = ENGINE_API.drg('224')
# => {"id"=>177, "number"=>"244", "name"=>"PERMANENT CARDIAC PACEMAKER IMPLANT WITHOUT CC/MCC", "short_name"=>"Permanent Cardiac Pacemaker Implant", "relative_weight"=>2.1108, "average_price"=>44082, "geometric_mean_los"=>2.3, "arithmetic_mean_los"=>2.7, "price"=>18291, "mcc"=>false, "cc"=>false}
```