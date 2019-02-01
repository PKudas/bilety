class EventsController < ApplicationController
	
	before_action :set_event, only: [:show, :edit]
	before_action :check_logged_in, :only => [:new, :create]
	
  def index
		@events = Event.all
		@tickets = Ticket.all
		#@users = User.all
  end
	
	def show
		@ticket = Ticket.new
  end

  def new
		@event=Event.new
		@ticket = Ticket.new
		#@ticket = current_user.tickets
		#@user= User.new
  end

  def create
		event_params = params.require(:event).permit(:artist, :description,:price_low, :price_high, :event_date)
		@event = Event.new(event_params)
		
		#respond_to do |format|
      if @event.save
        flash[:komunikat] = 'Event został poprawnie stworzony.' 
				redirect_to "/events/#{@event.id}"
        #format.json { render :show, status: :created, location: @event }
      else
        render :new
        #format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    #end
  end
	
	private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
			
    end
	
	private
		def check_logged_in
					authenticate_or_request_with_http_basic("Ads") do |username, password|
								username == "admin" && password == "1234"
					end
		end
	

end
