require "houston/kanban/railtie"

module Houston
  module Kanban
    class Engine < ::Rails::Engine
      isolate_namespace Houston::Kanban

      initializer :assets do |config|
        Rails.application.config.assets.precompile += %w(
          houston/kanban/application.js
          houston/kanban/application.css )
      end

      initializer :append_migrations do |app|
        unless app.root.to_s.match root.to_s
          config.paths["db/migrate"].expanded.each do |expanded_path|
            app.config.paths["db/migrate"] << expanded_path
          end
        end
      end

    end
  end
end
