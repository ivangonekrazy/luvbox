class LuvController < ApplicationController
  def show_luv
    @users = User.all
  end

  def send_luv
  end
end
