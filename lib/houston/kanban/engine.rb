require "houston/kanban/railtie"

module Houston
  module Kanban
    class Engine < ::Rails::Engine
      isolate_namespace Houston::Kanban
      
      # Enabling assets precompiling under rails 3.1
      if Rails.version >= '3.1'
        initializer :assets do |config|
          Rails.application.config.assets.precompile += %w(
            houston/kanban/application.js
            houston/kanban/application.css )
        end
      end
      
    end
  end
end
