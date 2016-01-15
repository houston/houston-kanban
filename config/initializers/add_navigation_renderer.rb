Houston.config.add_navigation_renderer :kanban do
  render_nav_link "Kanban", Houston::Kanban::Engine.routes.url_helpers.kanban_path, icon: "fa-thumbs-up"
end
