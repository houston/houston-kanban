module Houston::Kanban
  class Configuration

    def initialize
      config = Houston.config.module(:kanban).config
      instance_eval(&config) if config
    end

    def queues(&block)
      if block_given?
        builder = Houston::Kanban::QueuesBuilder.new
        builder.instance_eval(&block)
        @queues = builder.queues
      end
      @queues ||= []
    end

  end

  class QueuesBuilder
    attr_reader :queues

    def initialize
      @queues = []
    end

    def method_missing(slug, *args, &block)
      builder = QueueBuilder.new(slug)
      builder.instance_eval(&block)
      @queues << builder.queue
    end

  end

  class QueueBuilder

    def initialize(slug)
      @slug = slug.to_s
    end

    def name(name)
      @name = name
    end

    def description(description)
      @description = description
    end

    def where(&block)
      @where = block
    end

    def queue
      { slug: @slug,
        name: @name,
        description: @description,
        where: @where }
    end

  end
end
