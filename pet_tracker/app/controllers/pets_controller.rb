require 'date'
class PetsController < ApplicationController

  get '/pet' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pet/new' do
    erb :'/pets/new'
  end 

  get '/pet/:id' do
      find_pet
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

  helpers do
    def find_pet
      @pet = Pet.find_by_id(params[:id])
    end
  end
end