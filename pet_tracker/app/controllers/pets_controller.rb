require 'date'
class PetsController < ApplicationController

  get '/pet' do
    @pets = Pet.all
    @pet = Pet.find_by_id(session[:pet_id])
    erb :'/pets/index'
  end

  get '/pet/new' do
    erb :'/pets/new'
  end 

  get '/pet/:id' do
      find_pet
      session[:pet_id] = @pet.id if @pet
      redirect_if_pet_not_found
    erb :'/pets/show'
  end

  get '/pet/:id/edit' do
      find_pet
    erb :'pets/edit'
  end

  post '/pet' do
    pet = Pet.new(params[:pet])

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
  end
end
