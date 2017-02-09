class ProfilesController < ApplicationController
 before_action :authenticate_user!
 before_action :find_current_user, only: [:edit, :update, :show, :new]
	def index
		 @profiles = Profile.all
	end

	def show
		@profile
	end

	def edit
		@profile
	end

	def update
	  @profile = current_user.profile
    	if @profile.update_attributes(profile_params)
			redirect_to profile_path(@profile)
	    else
	      render 'edit'
	    end
	end
	
	private
	
	def find_current_user
		@profile = current_user.profile
	end
	
	def profile_params
	  params.require(:profile).permit(:name, :last_name, :user_id)
	end
end
