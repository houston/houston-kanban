require "houston/kanban/engine"
require "houston/kanban/configuration"

module Houston
  module Kanban
    extend self

    attr_reader :config

  end

  Kanban.instance_variable_set :@config, Kanban::Configuration.new
end
