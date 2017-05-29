# AssetsDeployer
Asset files deployer for rails application.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'assets_deployer'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install assets_deployer
```

## Usage

### Rails
Add initializer at `config/iniitializers/assets_deployer.rb`
```rb
AssetsDeployer.configure do |config|
  config.assets_root_path = Rails.root.join('public')
  config.assets_prefixes  = ['assets', 'packs']
  # your storage
  config.storage.platform = 'AWS'
  config.storage.name     = 'S3'
  # bucket and assets prefix key
  config.storage.options[:bucket]     = 'bucket_name'
  config.storage.options[:prefix_key] = 'project_name'
  # credentials
  # Also, you can use environment variables (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY) or instance profile credentials
  config.storage.credentials[:access_key_id]     = 'aws_access_key_id'
  config.storage.credentials[:secret_access_key] = 'aws_secret_access_key'
end
```

then you can use this rails command
```console
$ bundle exec rails assets:precompile assets:deploy
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
