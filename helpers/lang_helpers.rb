module LangHelpers
  def active_lang?(lang)
    lang == I18n.locale
  end

  def head_lang_links
    links = []
    langs.each do |lang|
      next if lang == I18n.locale

      url    = lang_url(lang)
      links << "<link href=\"#{url}\" hreflang=\"#{lang}\" rel=\"alternate\" />"
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
