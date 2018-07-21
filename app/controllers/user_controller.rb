class UserController < ApplicationController

  def login

    if request.post?
			url = "#{api_link}/login"
      user_credentials = {email: params[:email], password: params[:password]}
      
      begin
			  output = JSON.parse(RestClient.post url, user_credentials)
      rescue
        redirect_to '/login' and return
      end

			if output['access_token']
        url = "#{api_link}/employee"
        session[:token] = output['access_token']
			  session[:employee]  = output['user']

        redirect_to '/' and return
      end
    end

    reset_session
    render layout: false
  end
end
