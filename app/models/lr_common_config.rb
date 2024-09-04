# frozen_string_literal: true

# Encapsulates common configuration options across the LR open
# data applications, and provides defaults where appropriate
class LrCommonConfig
  class << self
    include ActionView::Helpers::UrlHelper

    def app_link(app_name, request, css_classes)
      root = app_name == '/'
      # Set the css classes for the link if they are not set
      link_classes = set_link_classes(app_name, css_classes, root, request.original_url)
      # Sub replaces just the first instance of the app name in the relative_url_root
      path = root ? app_name : relative_url_root.sub(%r{[^/]*\Z}, app_name)
      # Add the lang param if it exists
      path += "?lang=#{request.params[:lang]}" if request.params[:lang].present?
      # if the app name is the same as the current app, set the path to the root
      t_name = root ? 'common.header.app_title' : "common.app.#{app_name}"
      # Set the link id if an id is required
      link_id = root ? 'proposition-name' : nil
      # Return the link with the css classes and path set accordingly
      link_to(I18n.t(t_name), path, class: link_classes, id: link_id)
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

    # Returns a space separated string of css classes for the link
    # If the classes are not set, the default class is set
    # If the app name is the same as the current url, the active class is set
    def set_link_classes(name, classes, root, current_url)
      classes = Array.wrap(classes) if classes.present?
      # If the current url contains the app name, set the active class
      if root == false && current_url =~ /#{name}/
        classes << 'lr-header--header-proposition--a__active'
      end
      classes.join(' ')
    end
  end
end
