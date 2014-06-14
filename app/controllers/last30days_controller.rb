class Last30daysController < ApplicationController
  def index
    @last30daysbyitem = List.completed.where(user_id: current_user.id).select("name, sum(price) as totalprice").group("name")
    @last30daysbystore = List.completed.where(user_id: current_user.id).select("store_id, sum(price) as totalprice").group("store_id")
    @last30daysbycategory = List.completed.where(user_id: current_user.id).select("item_category_id, sum(price) as totalprice").group("item_category_id")
    @last30daysbybrand = List.completed.where(user_id: current_user.id).select("brand_id, sum(price) as totalprice").group("brand_id")
  end
end
