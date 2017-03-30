# Encapsulates common configuration options across the LR open
# data applications, and provides defaults where appropriate
class LrCommonConfig
  class << self
    include ActionView::Helpers::UrlHelper

    def page_title
      config_option(:lr_page_title, 'Land Registry house price data')
    end

    def application_css_class
      config_option(:lr_application_css_class, 'lr-app')
    end

    def lr_logo_link_href
      config_option(:lr_logo_href, 'https://www.gov.uk/government/organisations/land-registry/')
    end

    def lr_logo_link_title
      config_option(:lr_logo_title, 'Land Registry home page')
    end

    def lr_logo_link_image
      config_option(:lr_logo_image, 'lr_logo_221_80.png')
    end

    def home_path
      '/'
    end

    def app_link(app_name, app_title, request)
      css_classes = ['lr-header--header-proposition--a']
      if request.original_url =~ /#{app_name}/
        css_classes << 'lr-header--header-proposition--a__active'
      end

      path = relative_url_root.sub(%r{[^/]*\Z}, app_name)
      link_to(app_title, path, class: css_classes.join(' '))
    end

    def relative_url_root
      Rails.application.config.relative_url_root || '/'
    end

    def config_option(key, default)
      opt = Rails.application.config.x.send(key.to_sym)
      actual_config_option?(opt) || default
    end

    def actual_config_option?(opt)
      opt.respond_to?(:'empty?') && opt.empty? ? false : opt
    end
  end
end
