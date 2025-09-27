source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

#git_source(:github) do |repo_name|
#  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
#  "https://github.com/#{repo_name}.git"
#end

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.0.2'

# Use SCSS for stylesheets
gem 'sass-rails'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
#gem 'webpacker'
gem 'shakapacker', '~> 6.5'   # or the latest 6.x you see on RubyGems

gem 'bootstrap-sass'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
#gem "jbuilder"

# See https://github.com/rails/execjs#readme for more supported runtimes
#gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Reduces boot times through caching; required in config/boot.rb
# gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem 'annotate'
gem 'hpricot', github: 'ycorredius/hpricot'#, '>= 0.8.6'
#gem 'nokogiri', '~> 1.13.10'
gem 'rack-openid', require: 'rack/openid'
gem 'will_paginate' #, '~> 3.0'
gem 'tinymce-rails' #, '~> 4.3.3' #compatible with ruby 1.8.7
gem 'newrelic_rpm'
gem 'spawnling'
gem 'dynamic_form'
gem 'activeresource', require: 'active_resource'
gem 'delayed_job_active_record'
gem 'activerecord-postgis-adapter'
gem 'pg', '1.5.9'

gem 'jquery-ui-rails',            '7.0.0',        github: 'jquery-ui-rails/jquery-ui-rails',  tag: 'v7.0.0'
gem 'restful-authentication',     '2.0.0.beta1',  github: 'raszi/restful-authentication', branch: 'rails4'

gem 'active_resource_extensions', '2.2.9',        github: 'thl/active_resource_extensions',  tag: 'v2.2.9' #path: '../../thl/engines/active_resource_extensions'
gem 'acts_as_family_tree',        '1.3.2',        github: 'thl/acts_as_family_tree',         tag: 'v1.3.2' #path: '../../thl/engines/acts_as_family_tree'
gem 'authenticated_system',       '2.5.0',        github: 'thl/authenticated_system',        tag: 'v2.5.0' #path: '../../thl/engines/authenticated_system'
gem 'complex_dates',              '2.4.4',        github: 'thl/complex_dates',               tag: 'v2.4.4' #path: '../../thl/engines/complex_dates'
gem 'complex_scripts',            '3.2.6',        github: 'thl/complex_scripts',             tag: 'v3.2.6' #path: '../../thl/engines/complex_scripts'
gem 'interface_utils',            '2.4.7',        github: 'thl/interface_utils',             tag: 'v2.4.7' #path: '../../thl/engines/interface_utils'
gem 'ffi-icu',                    '0.5.4',        github: 'shanti-uva/ffi-icu',              tag: 'v0.5.4' #path: '../engines/ffi-icu'
gem 'flare',                      '1.4.9',        github: 'shanti-uva/flare',                tag: 'v1.4.9' #path: '../engines/flare'
gem 'mms_integration',            '2.4.8',        github: 'thl/mms_integration',             tag: 'v2.4.8' #branch: 'without-local', path: '../../thl/engines/mms_integration'
gem 'kmaps_engine',               '6.9.6',        github: 'shanti-uva/kmaps_engine',         tag: 'v6.9.6' #path: '../engines/kmaps_engine'
gem 'places_integration',         '2.3.0',        github: 'thl/places_integration',          tag: 'v2.3.0' #path: '../../thl/engines/places_integration'
gem 'places_engine',              '5.5.3',        github: 'thl/places_engine',               tag: 'v5.5.3' #path: '../../thl/engines/places_engine'
gem 'resource_controller',        '0.9.6',        github: 'shanti-uva/resource_controller',  tag: 'v0.9.6' #path: '../engines/resource_controller'
gem 'shanti_integration',         '3.6.9',        github: 'shanti-uva/shanti_integration',   tag: 'v3.6.9' #path: '../engines/shanti_integration'
gem 'subjects_integration',       '0.3.6',        github: 'shanti-uva/subjects_integration', tag: 'v0.3.6' #path: '../engines/subjects_integration'
gem 'universal_navigation',       '3.1.7',        github: 'thl/universal_navigation',        tag: 'v3.1.7' #path: '../../thl/engines/universal_navigation'

# CHECK TO SEE IF I NEED TO DELETE LATER:
gem 'rails-observers', github: 'rails/rails-observers'
gem 'actionpack-page_caching'
#gem 'actionpack-action_caching'
gem 'actionpack-action_caching', github: 'rails/actionpack-action_caching'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end