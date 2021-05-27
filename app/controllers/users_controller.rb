# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :redirect_root, only: :new

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: '会員登録しました'
    else
      flash.now[:danger] = '登録できませんでした'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :icon, :icon_cache)
  end
end
