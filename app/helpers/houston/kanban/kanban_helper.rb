module Houston::Kanban
  module KanbanHelper

    def group_tickets_by_queue_and_project(tickets, projects)
      projects_by_id = projects.index_by(&:id)

      KanbanQueue.all.each_with_object({}) do |queue, tickets_by_queue|
        tickets_in_queue = projects_by_id.keys.each_with_object({}) { |project_id, hash| hash[project_id] = [] }
        queue.filter(tickets).each do |ticket|
          tickets_in_queue[ticket.project_id].push(ticket)
        end
        tickets_by_queue[queue.slug] = tickets_in_queue
      end
    end



    def random_ticket_age # in seconds
      case rand(3)
      when 0; rand(3.hours)
      when 1; rand(3.weeks)
      when 2; rand(3.months)
      end
    end

    def random_ticket_number
      rand(5000) + 1
    end

    def random_density
      case rand(5)
      when 0..1; 4
      when 2..3; 16
      when 4; 64
      end
    end

  end
end
