class UserController < ApplicationController

  def login

    if request.post?
			url = "#{office_api_location}/login"
      user_credentials = {email: params[:username], password: params[:pass]}

      begin
			  output = JSON.parse(RestClient.post url, user_credentials)
      rescue
        redirect_to '/login' and return
      end

			if output['access_token']
        url = "#{office_api_location}/employee"
        session[:token]     = output['access_token']

				user_credentials = {Authorization: session[:token]}

				output = RestClient::Request.execute( { :method => :post, :url => url,
        :payload => {:email => params[:username]}, 
        :headers => {:Authorization => session[:token]} } )

			  session[:employee]  = JSON.parse(output)

        redirect_to '/' and return
      end
    end

    reset_session
    render layout: false
  end
end
