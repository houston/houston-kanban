require "houston/kanban/engine"
require "houston/kanban/configuration"

module Houston
  module Kanban
    extend self
    
    attr_reader :config
    
    def menu_items_for(context={})
      projects = context[:projects]
      ability = context[:ability]
      user = context[:user]
      
      projects = projects.select { |project| ability.can?(:read, project) }
      return [] if projects.empty?
      
      menu_items = []
      menu_items << MenuItem.new("All Projects", Engine.routes.url_helpers.kanban_path)
      menu_items << MenuItemDivider.new
      menu_items.concat projects.map { |project| ProjectMenuItem.new(project, Engine.routes.url_helpers.project_kanban_path(project)) }
      menu_items
    end
    
  end
  
  Kanban.instance_variable_set :@config, Kanban::Configuration.new
end
