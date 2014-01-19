class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity.where(owner_id: @user.id).reverse
  end

end
