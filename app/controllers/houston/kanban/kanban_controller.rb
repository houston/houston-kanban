module Houston::Kanban
  class KanbanController < ApplicationController
    layout "houston/kanban/application"
    helper Houston::Kanban::KanbanHelper
    
    
    def index
      @title = "Kanban"
      
      @projects = followed_projects
    end
    
    
  end
end
