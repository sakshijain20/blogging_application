# frozen_string_literal: true

# :nodoc:
class SessionController < ApplicationController
  def new
    user = User.new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.password == (params[:session][:password])
      # Log the user in and redirect to the user's show page.
      # @token = @user.auth_token
      user.token = SecureRandom.hex
      session[:user_id] = user.id
      user.save
      session[:token] = user.token
      flash[:success] = 'Logged in successfully!'
      redirect_to root_url

    else
      # Create an error message.

      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end

    def destroy
      if @user
        @user.token = ''
        @user.save
        respond_to do |format|
          format.json { render json: { status: '200', message: 'logged out successfully' } }
        end
      end
    end
  end

  def edit; end

  def update; end
end
