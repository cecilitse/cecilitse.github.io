# HACK: Avoid "Option :lang / :locals is not supported by Slim::Engine" warning messages
#       https://github.com/middleman/middleman/issues/1077
::Slim::Engine.set_default_options lang: I18n.locale, locals: {}
::Sass.load_paths << File.join(root, 'node_modules')

set :css_dir,     'stylesheets'
set :fonts_dir,   'fonts'
set :images_dir,  'images'
set :js_dir,      'javascripts'

activate :autoprefixer

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch        = 'master'
  deploy.build_before  = true
end

activate :external_pipeline,
  name: :webpack,
  command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
  source: '.tmp/dist',
  latency: 1

activate :i18n, langs: [:en, :fr]
activate :livereload
activate :protect_emails

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_html, remove_input_attributes: false
  activate :minify_javascript

  compass_config do |config|
    config.sass_options = { debug_info:     false }
    config.sass_options = { line_comments:  false }
  end

  # "Ignore" JS so webpack has full control.
  ignore { |path| path =~ /\/([^\/]*)\.js$/ && $1 != 'all.bundle' }
end
