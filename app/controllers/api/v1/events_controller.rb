class Api::V1::EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
  
    # GET /events
    # Retrieves all events and renders them as JSON.
    def index
      @events = Event.all
      render json: @events
    end
  
    # GET /events/1
    # Retrieves a specific event by ID and renders it as JSON.
    def show
      render json: @event
    end
  
    # POST /events
    # Creates a new event based on the parameters received.
    def create
      @event = Event.new(event_params)
  
      # Renders the created event as JSON if successful, or renders the errors if unsuccessful.
      if @event.save
        render json: @event, status: :created
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /events/1
    # Updates a specific event based on the parameters received.
    def update
      if @event.update(event_params)
        render json: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /events/1
    # Deletes a specific event by ID.
    def destroy
      @event.destroy
      head :no_content
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = Event.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def event_params
        params.require(:event).permit(:title, :date, :time, :location, :description, :user_id)
      end    
  end