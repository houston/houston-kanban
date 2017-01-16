# Load Houston
require "houston/application"

# Configure Houston
Houston.config do

  # Houston should load config/database.yml from this module
  # rather than from Houston Core.
  root Pathname.new File.expand_path("../../..",  __FILE__)

  # Give dummy values to these required fields.
  host "houston.test.com"
  mailer_sender "houston@test.com"

  use :tickets do
    ticket_types(
      "Chore"       => "909090",
      "Feature"     => "8DB500",
      "Enhancement" => "3383A8",
      "Bug"         => "C64537" )
  end

  # Mount this module on the dummy Houston application.
  use :kanban do
    queues do
      unprioritized do

      end
      testing do

      end
    end
  end

end
