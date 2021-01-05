class PetsController < ApplicationController

  get '/pet' do
    @pets = Pet.all
    erb :'/pets/index'
  end


  get '/pet/new' do
    erb :'/pets/new'
  end 

  get '/pet/:id' do
    @pet = Pet.find_by_id(params[:id])
    erb :'/pets/show'
  end

  post '/pet' do
    pet = Pet.new(params[:pet])

    if pet.save
      redirect '/pet'
    else
      redirect '/pet/new' 
    end
  end
end