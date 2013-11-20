require 'slim'

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
end

activate :i18n, langs: [:en, :fr]
activate :livereload

set :css_dir,     'stylesheets'
set :fonts_dir,   'fonts'
set :images_dir,  'images'
set :js_dir,      'javascripts'

configure :build do
  activate :minify_css
  activate :minify_javascript
end

::Slim::Engine.set_default_options lang: I18n.locale
