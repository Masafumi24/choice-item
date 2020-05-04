class UsersController < ApplicationController
  before_action :set_user, only: [:show, :userpage]

  def show
    if user_signed_in?
      @useritems = Item.includes_images.where(user_id:(current_user.id)).newturn
    end
    @otherUser = User.find(params[:id])
    @otherUseritems = Item.includes_images.where(user_id:(@otherUser.id)).newturn
  end

end
