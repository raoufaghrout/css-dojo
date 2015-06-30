set :host, 'http://oss.jahed.io'

set :css_dir, './stylesheets'
set :js_dir, './javascripts'
set :images_dir, './images'
# set :relative_links, true

# activate :automatic_image_sizes
# activate :relative_assets
# activate :directory_indexes

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
end

helpers do

  def abs_image_url(source)
    URI.join(host, image_path(source)).to_s
  end

  def abs_url(source='')
    URI.join(host, source).to_s
  end

  def slide(&block)
    content = capture_html(&block)
    concat '<section>'
    concat find_and_preserve { Redcarpet::Markdown.new(Redcarpet::Render::XHTML, {:fenced_code_blocks => true}).render(content) }
    concat '</section>'
  end
end

configure :development do
  set :host, "http://localhost:4567"
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  # Doesn't work with references in Javascript
  # activate :asset_hash
end