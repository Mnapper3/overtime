class PostPolicy < ApplicationPolicy
  
  def update?
    return true if post_approval? && admin?
    return true if user_or_admin && !post_approval?
  end
  
  def approve?
    admin?
  end
  
  private
  
    def user_or_admin
      record.user_id == user.id || admin?
    end
    
    def admin?
      admin_types.include?(user.type)
    end
    
    def post_approval?
      record.approved?
    end
  
end