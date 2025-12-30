# frozen_string_literal: true

# :nodoc:
module LrCommonStyles
  # :nodoc:
  class Engine < ::Rails::Engine
    initializer 'lr_common_styles.assets' do |app|
      # Only configure asset paths if an asset pipeline is available
      if app.config.respond_to?(:assets)
        # Add this gem's asset paths
        assets_path = root.join('app', 'assets', 'stylesheets')
        unless app.config.assets.paths.include?(assets_path.to_s)
          app.config.assets.paths << assets_path
        end

        # Add asset paths for gem dependencies so they're discoverable
        # when scss files import them
        dependency_gems = %w[
          govuk_template
          govuk_elements_rails
          bootstrap-sass
          font-awesome-rails
          govuk_frontend_toolkit
        ]

        dependency_gems.each do |gem_name|
          gem_spec = Gem.loaded_specs[gem_name]
          if gem_spec
            gem_assets_path = File.join(gem_spec.gem_dir, 'app', 'assets', 'stylesheets')
            if File.directory?(gem_assets_path) && app.config.assets.paths.exclude?(gem_assets_path)
              app.config.assets.paths << gem_assets_path
            end
          end
        rescue StandardError => e
          # Log but don't fail if gem is not available
          if Rails.env.development?
            Rails.logger.debug do
              "Could not add asset path for #{gem_name}: #{e.message}"
            end
          end
        end
      end
    end

    initializer 'lr_common_styles.debug' do |app|
      if Rails.env.development? && app.config.respond_to?(:assets)
        puts "\nAsset paths:\n#{app.config.assets.paths.map do |path|
          "#{path.inspect}\n"
        end.join}\n"
      end
    end
  end
end
