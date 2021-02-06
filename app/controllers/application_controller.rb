# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  def authenticate
    current_member = User.find_by(id: session[:user_id])

    if current_member
      request.headers['access-token'] = current_member.token
      if request.headers.include?('access-token') && request.headers['access-token'] == session[:token]
        # render :text => request.headers[‘access-token’]
        puts request.headers['access-token']
        true
      else
        head 403
      end
    else
      head 404
    end
  end
end
