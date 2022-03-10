class PagesController < ApplicationController
  # GET /
  def home
    render inertia: 'Home', props: {}
  end

  # GET /rails
  def rails
  end
end
