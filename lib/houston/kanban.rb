require "houston/kanban/engine"
require "houston/kanban/configuration"

module Houston
  module Kanban
    extend self

    def config(&block)
      @configuration ||= Kanban::Configuration.new
      @configuration.instance_eval(&block) if block_given?
      @configuration
    end

  end


  # Extension Points
  # ===========================================================================
  #
  # Read more about extending Houston at:
  # https://github.com/houston/houston-core/wiki/Modules


  # Register events that will be raised by this module
  #
  #    register_events {{
  #      "kanban:create" => params("kanban").desc("Kanban was created"),
  #      "kanban:update" => params("kanban").desc("Kanban was updated")
  #    }}


  # Add a link to Houston's global navigation
  #
  #    add_navigation_renderer :kanban do
  #      name "Kanban"
  #      icon "fa-thumbs-up"
  #      path { Houston::Kanban::Engine.routes.url_helpers.kanban_path }
  #      ability { |ability| ability.can? :read, Project }
  #    end


  # Add a link to feature that can be turned on for projects
  #
  #    add_project_feature :kanban do
  #      name "Kanban"
  #      icon "fa-thumbs-up"
  #      path { |project| Houston::Kanban::Engine.routes.url_helpers.project_kanban_path(project) }
  #      ability { |ability, project| ability.can? :read, project }
  #    end

end
