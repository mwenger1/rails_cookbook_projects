module ApplicationHelper
  def resource_class 
    User 
  end

  def plan_name(plan_id)
  	plan_name = Plan.where(:id=> plan_id).pluck(:name).first
  end
end
