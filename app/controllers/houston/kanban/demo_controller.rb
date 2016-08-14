module Houston::Kanban
  class DemoController < ApplicationController
    layout "houston/kanban/application"
    helper Houston::Kanban::KanbanHelper

    def index
      @colors = Houston.config.project_colors
      @ages = %w{young adult old}
    end

  end
end
