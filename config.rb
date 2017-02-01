activate :blog do |blog|
  blog.name = "videos"
  blog.prefix = "videos"
end

activate :blog do |blog|
  blog.name = "text"
  blog.prefix = "text"
end

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :directory_indexes
page "/404.html", directory_index: false

configure :build do
  activate :external_pipeline,
    name: :gulp,
    command: "npm run production",
    source: ".tmp",
    latency: 1

  activate :gzip

  # activate :asset_hash
  # activate :asset_host,
  #   host: "//cdn.cloudfront.net",
  #   rewrite_ignore: ["*.js"]

  # set :url_root, "http://example.com"

  # https://github.com/Aupajo/middleman-search_engine_sitemap
  # activate :search_engine_sitemap

  ignore "javascripts/all.js"
  ignore "stylesheets/site"

end
