# frozen_string_literal: true

# Encapsulates common configuration options across the LR open
# data applications, and provides defaults where appropriate
class LrCommonConfig
  class << self
    include ActionView::Helpers::UrlHelper

    def app_link(app_name, request)
      css_classes = ['lr-header--header-proposition--a']
      if request.original_url =~ /#{app_name}/
        css_classes << 'lr-header--header-proposition--a__active'
      end

      path = relative_url_root.sub(%r{[^/]*\Z}, app_name)
      path += "?lang=#{request.params[:lang]}" if request.params.key?(:lang)

      link_to(I18n.t("common.app.#{app_name}"), path, class: css_classes.join(' '))
    end

    def relative_url_root
      Rails.application.config.relative_url_root || '/'
    end
  end
end
