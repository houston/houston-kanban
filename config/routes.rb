Houston::Kanban::Engine.routes.draw do

  # This just renders a fake Kanban:
  # to give you an idea of what your queues, colors, and ages will look like
  get "demo", to: "demo#index"

  get "" => "kanban#index", :as => :kanban
  get ":slug" => "project_kanban#index", :as => :project_kanban

  constraints queue: Regexp.new(KanbanQueue.slugs.join("|")) do
    get ":slug/:queue" => "project_kanban#queue", :as => :project_kanban_queue
  end

end
