class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  # https://inertiajs.com/shared-data
  inertia_share flash: -> {
    {
      message: {
        alert: flash.alert,
        notice: flash.notice
      }
    }
  }
end
