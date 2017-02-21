class BookexchangesController < ApplicationController
	def create

		@bookexchange = _current_profile.bookexchanges.new(:book_id => params[:book_id])
	  	# byebug
	  	if @bookexchange.save  
		   render status: 201, json: @bookexchange
		end
	end

	private

	def _current_profile
		@current_profile = current_user.profile
	end
end
