class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  # https://inertiajs.com/shared-data
  inertia_share flash: lambda {
    {
      message: {
        alert: flash.alert,
        notice: flash.notice
      }
    }
  }
end
