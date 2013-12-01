# HACK: Avoid "Option :lang / :locals is not supported by Slim::Engine" warning messages
#       https://github.com/middleman/middleman/issues/1077
::Slim::Engine.set_default_options lang: I18n.locale, locals: {}

activate :deploy do |deploy|
  deploy.method       = :git
  deploy.branch       = 'master'
  deploy.build_before = false # always use --no-clean options
  deploy.strategy     = :submodule
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
