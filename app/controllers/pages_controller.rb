class PagesController < ApplicationController
  def home
    render inertia: 'Home', props: {
      time: Time.current.iso8601
    }
  end

  def contact
    render inertia: 'Contact', props: {}
  end
end
