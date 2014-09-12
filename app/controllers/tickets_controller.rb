class TicketsController < ApplicationController

	def new
		@ticket = Ticket.new
	end

	def show
		@ticket = Ticket.find(params[:id])
	end

	def create
		 @ticket = Ticket.new(ticket_params)    
    	if @ticket.save
    		thread = Thread.new { sleep 60 }
			session[:thread] = thread.object_id
     		redirect_to search_path
    	else
      		render 'new'
    	end
	end

	def search
		if ObjectSpace._id2ref(session[:thread].to_i).alive?
			render 'search'
		else
			render 'show'
		end	
	end

	private

	def ticket_params
      params.require(:ticket).permit(:from, :to, :date_of_journey, :journey_direction)
    end
end
