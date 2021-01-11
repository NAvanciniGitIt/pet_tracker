require './config/environment'
require 'sinatra/flash'
require 'date'
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

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
    end

    def is_logged_in?
      !!current_user
    end

    def redirect_if_logged_in
      redirect '/pet' if is_logged_in?
    end

    def redirect_if_not_logged_in
      redirect '/login' unless is_logged_in?
    end

    def redirect_if_not_user
      @user = User.find_by_id(params[:id])
      redirect '/' if @user != current_user
    end
  end

  def find_pet
    @pet = Pet.find_by_id(params[:id])
  end

  def redirect_if_pet_not_found
    redirect '/pet' unless @pet
  end

  def redirect_if_not_owner
    redirect '/pet' unless @pet.user == @current_user
    end
  end


