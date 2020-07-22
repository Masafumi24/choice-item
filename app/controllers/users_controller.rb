class UsersController < ApplicationController
  before_action :set_user, only: [:show, :userpage]

  def show
    @useritems = Item.user_items_get(current_user.id) if user_signed_in?
    @otherUser = User.find(params[:id])
    @otherUseritems = Item.includes(:images).where(user_id:(@otherUser.id)).newturn
  end

end
