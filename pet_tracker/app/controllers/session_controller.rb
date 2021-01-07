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
      redirect '/pet'
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

  get '/profile/:id/edit' do
    redirect_if_not_logged_in
    redirect_if_not_user
    erb :'sessions/edit'
  end

  patch '/profile/:id' do
    !!current_user
    redirect_if_not_user
    redirect_if_not_logged_in
    if @current_user.update(params[:user])
      redirect "/profile/#{@current_user.id}"
    else
      redirect "/profile/#{@current_user.id}/edit"
    end
  end 

  delete '/profile/:id' do
    !!current_user
    redirect_if_not_user
    redirect_if_not_logged_in
    @current_user.destroy if @current_user
    redirect '/'
  end
  
  get '/logout' do
    session.clear
    redirect '/login'
  end
end