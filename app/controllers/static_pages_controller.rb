class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])

      @user_orders = current_user.orders.paginate(page: params[:page])
      @user_microposts = current_user.microposts.paginate(page: params[:page])
    end
  end  

  def help
  end

  def about
  end

  def contact
  end
end
