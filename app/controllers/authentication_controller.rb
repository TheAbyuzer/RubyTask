class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 def authenticate
   command = AuthenticateUser.call(params[:email], params[:password])
   if command.success?
     render json: { auth_token: command.result }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end

 def register

   params.require(:name)
   params.require(:email)
   params.require(:password)
   params.require(:password_confirmation)
   @user = User.create(name:params[:name],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation],image:params[:image])
   if @user.save
     render json: {done:"User Created Successfully"}
   else
     render json: @user.errors, status: :unprocessable_entity
   end
 end
end
