gem 'hamlit-rails'
gem 'erb2haml'
gem 'devise'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'pry-rails'
end

application <<-CONFIG
  config.generators do |g|
    g.test_framework :rspec,
      fixtures: true,
      view_specs: false,
      helper_specs: false,
      routing_specs: false,
      controller_specs: false,
      request_specs: false
    g.fixture_replacement :factory_bot, dir: 'spec/factories'
    g.assets false
    g.helper false
    g.javascripts false
    g.stylesheets false
  end

  config.time_zone = 'Tokyo'
CONFIG

run 'bundle install'
rails_command 'generate rspec:install'
rails_command 'generate devise:install'
rails_command 'hamlit:erb2haml'

rails_command 'db:reset'
rails_command 'db:migrate'
