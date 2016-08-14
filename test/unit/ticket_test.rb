require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  attr_reader :ticket, :release, :released_at

  setup do
    Ticket.nosync = true
  end



  context "#exit_queues!" do
    setup do
      @ticket = Ticket.create!(project_id: 1, number: 1, summary: "Test summary", type: "Bug")
    end

    should "remove the ticket from all of its queues" do
      queues = []
      queues << TicketQueue.create!(ticket: ticket, queue: "unprioritized")
      queues << TicketQueue.create!(ticket: ticket, queue: "testing")

      ticket.exit_queues!

      assert queues.all? { |queue| queue.reload.destroyed_at.present? },
        "TicketQueue#destroyed_at should now be present"
    end
  end



end
