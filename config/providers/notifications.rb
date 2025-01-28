# frozen_string_literal: true

Hanami.app.register_provider :notifications, namespace: true do
  prepare do
    require_relative "../../slices/notifications/data/notification_repository"
    require_relative "../../slices/notifications/business/notification_service"
    require_relative "../../slices/notifications/presentation/notification_controller"
  end

  start do
    # Initialize from bottom layer up
    notification_repository = Notifications::Data::NotificationRepository.new

    notification_service = Notifications::Business::NotificationService.new(
      notification_repository: notification_repository
    )

    notification_controller = Notifications::Presentation::NotificationController.new(
      notification_service: notification_service
    )

    # Register components
    register "notification_repository", notification_repository
    register "notification_service", notification_service
    register "notification_controller", notification_controller
  end
end
