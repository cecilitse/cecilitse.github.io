module UrlsHelper
  def host_url(url)
    URI.join("http://#{data.site.host}", url)
  end
end
