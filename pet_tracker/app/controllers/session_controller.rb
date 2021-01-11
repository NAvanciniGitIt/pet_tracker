class SessionController < ApplicationController

  get '/signup' do
    erb :'/sessions/signup'
  end

  post '/signup' do
    redirect_if_logged_in
    user = User.new(params[:user]) 
    if user.save
      session[:user_id] = user.id
      redirect '/pet'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    redirect_if_logged_in
    erb :'/sessions/login'
  end

  post '/login' do
    user = User.find_by_username(params[:user][:username].capitalize.gsub(" ",""))
    if user && user.authenticate(params[:user][:password]) #first ensure user exists, then authenticate
      session[:user_id] = user.id #log user in
      redirect '/profile'
    else
      redirect '/login'
  end
end

  get '/profile' do
    redirect '/profile/:id'
  end

  get '/profile/:id' do
    redirect_if_not_logged_in
    redirect_if_not_user
      erb :'sessions/profile'
  end

  delete '/profile/:id' do
    is_logged_in?
    @current_user.destroy if @current_user
    redirect '/'
    redirect_if_not_user
    redirect_if_not_logged_in
  end
  
  get '/logout' do
    session.clear
    redirect '/login'
  end
end