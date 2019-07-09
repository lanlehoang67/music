class EventsController < ApplicationController
	before_action :load_event, only: :show

  def index
  end

  def show
  end

  def create
  end

  private

  def load_event
  	@event = Event.find_by id: params[:id]
  end
end
