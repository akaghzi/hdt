class Last30daysController < ApplicationController
  def index
    @last30daysbyitem = ListItem.completed.where(user_id: current_user.id).select("name, sum(price) as totalprice").group("name").order("totalprice desc")
    @last30daysbystore = ListItem.completed.where(user_id: current_user.id).select("store_id, sum(price) as totalprice").group("store_id").order("totalprice desc")
    @last30daysbycategory = ListItem.completed.where(user_id: current_user.id).select("item_category_id, sum(price) as totalprice").group("item_category_id").order("totalprice desc")
    @last30daysbybrand = ListItem.completed.where(user_id: current_user.id).select("brand_id, sum(price) as totalprice").group("brand_id").order("totalprice desc")
  end
end
