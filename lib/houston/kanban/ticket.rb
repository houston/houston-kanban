require "active_support/concern"

module Houston
  module Kanban
    module Ticket
      extend ActiveSupport::Concern

      included do
        has_many :ticket_queues, -> { where(destroyed_at: nil) }
      end

      module ClassMethods

        def in_queue(queue, arg=nil)
          if arg == :refresh
            sync_tickets_in_queue(queue)
          else
            includes(:ticket_queues).merge(TicketQueue.named(queue))
          end
        end

        def sync_tickets_in_queue(queue)
          queue = KanbanQueue.find_by_slug(queue) unless queue.is_a?(KanbanQueue)
          transaction do
            queue.filter(scoped).tap do |tickets_in_queue|

              ids = pluck(:id).uniq # <-- for some reason this performs a CRAZY query
              ticket_ids_were_in_queue = TicketQueue
                .where(queue: queue.slug, destroyed_at: nil, ticket_id: ids)
                .pluck(:ticket_id)
              ticket_ids_in_queue = tickets_in_queue.pluck(:id)
              TicketQueue.enter! queue, ticket_ids_in_queue - ticket_ids_were_in_queue
              TicketQueue.exit!  queue, ticket_ids_were_in_queue - ticket_ids_in_queue

            end
          end
        end

      end

      def exit_queues!
        ticket_queues.exit_all!
      end

      def age_in(queue)
        queue = queue.slug if queue.is_a?(KanbanQueue)
        age_in_queues.fetch(queue, 0)
      end

      def age_in_queues
        @age_in_queues ||= Hash[ticket_queues.map { |queue| [queue.queue, queue.queue_time] }]
      end

    end
  end
end
