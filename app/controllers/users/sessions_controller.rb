class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  api :GET, "/users/sign_in" ,"View  sign_in"
  def new
    super
   end

  # POST /resource/sign_in
  api :POST, "/users/sign_in" ,"sign_in user" 
  param :user, Hash, :desc => "user hash table" do
    param :email, String, :desc => "email", :required => true
    param :password, String, :desc => "password", :required => true
    param :remember_me, [true, false], :desc => "remember_me"
    param :authenticity_token, String, :desc => "authenticity_token", :required => true
  end
   def create
     super
   end

  # DELETE /resource/sign_out
  api :DELETE, "/resource/sign_out" ,"Sign out method" do
    param :authenticity_token, String, :desc => "authenticity_token", :required => true
  end
   def destroy
     super
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
