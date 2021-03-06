class UsersController < ApplicationController
  def show
    @user = User.where(id: params[:id]).first
    render json: @user
  end

  def update
    # no need to find a user (until an admin is built)
    @user = current_user

    if !@user
      render json: {}, status: :forbidden
    elsif @user.update_attributes(params[:user])
      render json: @user
    else
      render json: @user, status: :failed
    end
  end
end

