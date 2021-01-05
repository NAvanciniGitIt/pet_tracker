class UserController < ApplicationController

  get "/signup" do
    erb :'/user/sign_up'
  end

end