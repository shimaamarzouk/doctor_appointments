# frozen_string_literal: true

require 'logger'

module Notifications
  module Data
    class NotificationRepository
      def initialize(logger = Logger.new($stdout))
        @logger = logger
      end

      def send_notification(message)
        @logger.info(message)
      end
    end
  end
end
