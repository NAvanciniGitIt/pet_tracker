require 'date'
class PetsController < ApplicationController

  get '/pet' do
    redirect_if_not_logged_in
    @pets = current_user.pets
    @pet = Pet.find_by_id(session[:pet_id])
    erb :'/pets/index'
  end

  get '/pet/new' do
    redirect_if_not_logged_in
    erb :'/pets/new'
  end 

  get '/pet/:id' do
    redirect_if_not_logged_in
      find_pet
      redirect_if_not_owner
      session[:pet_id] = @pet.id if @pet
      redirect_if_pet_not_found
    erb :'/pets/show'
  end

  get '/pet/:id/edit' do
    redirect_if_not_logged_in
      find_pet
      redirect_if_not_owner
      redirect_if_pet_not_found
    erb :'pets/edit'
  end

  post '/pet' do
    pet = current_user.pets.build(params[:pet]) #active record association to make a new object based on that association
    if pet.save
      redirect '/pet'
    else
      redirect '/pet/new' 
    end
  end

  patch '/pet/:id' do
    find_pet
    redirect_if_pet_not_found
    if @pet.update(params[:pet])
      redirect "/pet/#{@pet.id}"
    else
      redirect "/pet/#{@pet.id}/edit"
    end
  end

  delete '/pet/:id' do
    find_pet
    redirect_if_pet_not_found
    redirect_if_not_owner
    @pet.destroy if @pet
    redirect '/pet'
  end

  helpers do
    def find_pet
      @pet = Pet.find_by_id(params[:id])
    end

    def redirect_if_pet_not_found
      redirect '/pet' unless @pet
    end

    def redirect_if_not_owner
      redirect '/pet' unless @pet.user == current_user
    end
  end
end
