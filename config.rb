# HACK: Avoid "Option :lang / :locals is not supported by Slim::Engine" warning messages
#       https://github.com/middleman/middleman/issues/1077
::Slim::Engine.set_default_options lang: I18n.locale, locals: {}

activate :bower

activate :deploy do |deploy|
  deploy.method       = :git
  deploy.branch       = 'master'
  deploy.build_before = true
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

  compass_config do |config|
    config.sass_options = { debug_info:     false }
    config.sass_options = { line_comments:  false }
  end
end
