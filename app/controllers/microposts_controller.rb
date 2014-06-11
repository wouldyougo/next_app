# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#puts "Hello World"

class MicropostsController < ApplicationController
  #before_action :signed_in_user, only: [:create, :destroy]
  before_action :signed_in_user, only: [:create, :destroy, :index]
  before_action :correct_user,   only: :destroy
  
  def index
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    #@feed_items = current_user.feed.paginate(page: params[:page])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      # так не работает
      #@feed_items = []
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end
  
  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
  