# frozen_string_literal: true

require 'securerandom'

module AppointmentBooking
  module Domain
    module Repositories
      class SlotRepository
        def find_available
          raise NotImplementedError
        end
      end
    end
  end
end
