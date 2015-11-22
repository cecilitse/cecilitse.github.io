module MetaTagsHelper
  def meta_tag_description
    I18n.t('page.meta_description')
  end

  def meta_tag_image
    host_url(image_path('avatar.png'))
  end

  def meta_tag_page_title
    "#{I18n.t('page.title')} - #{data.me.name}"
  end

  def meta_tag_site_name
    data.me.name
  end

  def meta_tag_title
    meta_tag_page_title
  end

  def meta_tag_twitter
    "@#{data.site.twitter}"
  end

  def meta_tag_url
    host_url(current_page.url)
  end
end
