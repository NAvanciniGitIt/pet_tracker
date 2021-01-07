require './config/environment'
require 'sinatra/flash'
class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end
    helpers do
    def is_logged_in?
      !!session[:user_id]#is there any user id?
    end

    def redirect_if_logged_in
      redirect '/games' if is_logged_in?
    end

    def redirect_if_not_logged_in
      redirect '/login' unless is_logged_in?
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
    end
  end
end

