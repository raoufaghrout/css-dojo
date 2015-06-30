set :css_dir, './stylesheets'
set :js_dir, './javascripts'
set :images_dir, './images'
set :layout, false

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end