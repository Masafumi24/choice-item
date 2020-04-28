class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @useritems = Item.includes_images.where(user_id:(current_user.id)).newturn
  end

end
