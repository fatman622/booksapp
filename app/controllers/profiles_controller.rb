class ProfilesController < ApplicationController
 before_action :authenticate_user!
 before_action :find_current_user, only: [:edit, :update, :show, :new]

 	api :GET, "/profiles" ,"This is for index profiles page, all profiles" do
	param :profiles, Profile, :desc => "All profiles", :require => false
	end
	def index
		 @profiles = Profile.all
	end

	api :GET, "/profiles/:id" ,"Return profile by id" do
	param :id, Integer, :desc => "Profile id", :require => true
	end
	def show
		@profile
	end

	api :GET, "/profiles/:id/edit" ,"Return view for edit wit current profile" do
	param :id, Integer, :desc => "Profile id", :require => true
	end
	def edit
		@profile
	end

	api :PATCH, "/profiles/:id" ,"Update profile for curent user" do
	param :id, Integer, :desc => "Profile id", :require => true
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
	  params.require(:profile).permit(:name, :last_name, :user_id, :image)
	end
end
