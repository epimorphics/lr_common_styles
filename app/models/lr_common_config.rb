# frozen_string_literal: true

# Encapsulates common configuration options across the LR open
# data applications, and provides defaults where appropriate
class LrCommonConfig
  class << self
    include ActionView::Helpers::UrlHelper

    def app_link(app_name, request)
      # Set the css classes for the link
      css_classes = ['lr-header--header-proposition--a']
      # If the current url contains the app name, set the active class
      if request.original_url =~ /#{app_name}/
        css_classes << 'lr-header--header-proposition--a__active'
      end
      # Sub replaces just the first instance of the app name in the relative_url_root
      path = relative_url_root.sub(%r{[^/]*\Z}, app_name)
      # Add the lang param if it exists
      path += "?lang=#{request.params[:lang]}" if request.params.key?(:lang)
      # Return the link with the css classes and path set accordingly
      link_to(I18n.t("common.app.#{app_name}"), path, class: css_classes.join(' '))
    end

    # Returns the relative url root for the app if running in a subdirectory
    # of the web server, or the root if it is not
    # If the app is running in production, and the relative_url_root excludes
    # /app, then the app name is appended to the relative_url_root of `/app`
    # This resolves the urls paths for the apps from the landing page, but not
    # for the apps themselves
    def relative_url_root
      root_url = Rails.application.config.relative_url_root || '/'
      root_url = "/app#{root_url}" if root_url.exclude?('app') && Rails.env.production?
      root_url
    end
  end
end
