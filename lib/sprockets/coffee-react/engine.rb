require 'sprockets'
require 'sprockets/coffee-react'
require 'sprockets/coffee-react-postprocessor'

if defined?(Rails)
  module Sprockets
    class CoffeeReact
      class Engine < ::Rails::Engine
        initializer :setup_coffee_react, :after => "sprockets.environment", :group => :all do |app|
          if app.assets
            configure_env app.assets
          else
            app.config.assets.configure { |env| configure_env env }
          end
        end

        def configure_env(env)
          env.register_mime_type 'application/javascript', extensions: ['.cjsx', '.js.cjsx'], charset: :default
          env.register_preprocessor 'application/javascript', Sprockets::CoffeeReact
          env.register_postprocessor 'application/javascript', Sprockets::CoffeeReactPostprocessor
        end
      end
    end
  end
end
