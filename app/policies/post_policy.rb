class PostPolicy < ApplicationPolicy
  
  def update?
    # post creater or  #admin user
    record.user_id == user.id || admin_types.include?(user.type)
  end
  
end