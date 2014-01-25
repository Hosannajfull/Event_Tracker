class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def new 
		@event = Event.new
	end

	def create 
		@event = Event.new(event_params)
		if @event.save
			redirect_to events_url
		else
			render action: "new"
		end 
	end

	def show
    	@event = Event.find(event_id)
    end 

	def edit
		@event = Event.find(event_id)
	end

	def update 
		@event = Event.find(event_id)

		if @event.update_attributes(event_params)
			redirect_to events_path
		else
			render action: "edit"
		end
	end

  def destroy
  	@event = Event.find(event_id)
  	@event.destroy
  		redirect_to events_url
  end

  private 
  def event_params
		params.require(:event).permit(:name, :description, :location, :id)
	end
	def event_id
		params.permit(:id)[:id]
	end
end
