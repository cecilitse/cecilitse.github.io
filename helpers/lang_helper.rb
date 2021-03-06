module LangHelper
  def active_lang?(lang)
    lang == I18n.locale
  end

  def head_lang_links
    links = []

    links << "<link href=\"#{host_url(lang_url(I18n.locale))}\" rel=\"canonical\">"

    langs.each do |lang|
      next if lang == I18n.locale
      links  << "<link href=\"#{host_url(lang_url(lang))}\" hreflang=\"#{lang}\" rel=\"alternate\" />"
    end

    links.join
  end

  def lang_url(lang)
    if lang == I18n.default_locale
      '/'
    else
      "/#{lang}"
    end
  end
end
