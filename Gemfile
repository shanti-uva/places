source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#git_source(:github) do |repo_name|
#  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
#  "https://github.com/#{repo_name}.git"
#end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '~> 5.1.4'
gem 'rails', '~> 5.2.3'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.7'
gem 'bootstrap-sass', '>= 3.4.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
#gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'hpricot'#, '>= 0.8.6'
gem 'nokogiri', '~> 1.13.10'
gem 'rack-openid', require: 'rack/openid'
gem 'will_paginate' #, '~> 3.0'
gem 'tinymce-rails' #, '~> 4.3.3' #compatible with ruby 1.8.7
gem 'newrelic_rpm'
gem 'spawnling'
gem 'dynamic_form'
gem 'activeresource', require: 'active_resource'
gem 'delayed_job_active_record'

gem 'restful-authentication',     '2.0.0.beta1',  github: 'raszi/restful-authentication', branch: 'rails4'

gem 'active_resource_extensions', '2.2.4',        github: 'thl/active_resource_extensions',  tag: 'v2.2.4' #path: '../../thl/engines/active_resource_extensions'
gem 'acts_as_family_tree',        '1.2.1',        github: 'thl/acts_as_family_tree',         tag: 'v1.2.1' #path: '../../thl/engines/acts_as_family_tree'
gem 'authenticated_system',       '2.4.1',        github: 'thl/authenticated_system',        tag: 'v2.4.1' #path: '../../thl/engines/authenticated_system'
gem 'complex_dates',              '2.3.6',        github: 'thl/complex_dates',               tag: 'v2.3.6' #path: '../../thl/engines/complex_dates'
gem 'complex_scripts',            '3.1.3',        github: 'thl/complex_scripts',             tag: 'v3.1.3' #path: '../../thl/engines/complex_scripts'
gem 'interface_utils',            '2.4.0',        github: 'thl/interface_utils',             tag: 'v2.4.0' #path: '../../thl/engines/interface_utils'
gem 'flare',                      '1.3.8',        github: 'shanti-uva/flare',                tag: 'v1.3.8' #path: '../engines/flare'
gem 'ffi-icu',                    '0.2.0',        github: 'shanti-uva/ffi-icu',              tag: 'v0.2.0' #path: '../engines/ffi-icu'
gem 'mms_integration',            '2.4.4',        github: 'thl/mms_integration',             branch: 'without-local' #tag: 'v2.4.4' #path: '../../thl/engines/mms_integration'
gem 'kmaps_engine',               '6.5.2',        github: 'shanti-uva/kmaps_engine',         tag: 'v6.5.2' #path: '../engines/kmaps_engine'
gem 'places_integration',         '2.2.4',        github: 'thl/places_integration',          tag: 'v2.2.4' #path: '../../thl/engines/places_integration'
gem 'places_engine',              '5.4.3',        github: 'thl/places_engine',               tag: 'v5.4.3' #path: '../../thl/engines/places_engine'
gem 'resource_controller',        '0.9.2',        github: 'shanti-uva/resource_controller',  tag: 'v0.9.2' #path: '../engines/resource_controller'
gem 'shanti_integration',         '3.5.7',        github: 'shanti-uva/shanti_integration',   tag: 'v3.5.7' #path: '../engines/shanti_integration'
gem 'subjects_integration',       '0.3.0',        github: 'shanti-uva/subjects_integration', tag: 'v0.3.0' #path: '../engines/subjects_integration'
gem 'universal_navigation',       '3.1.3',        github: 'thl/universal_navigation',        tag: 'v3.1.3' #path: '../../thl/engines/universal_navigation'

# CHECK TO SEE IF I NEED TO DELETE LATER:
gem 'rails-observers'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'
gem 'activemodel-serializers-xml'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
