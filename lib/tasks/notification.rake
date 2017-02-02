namespace :notification do
  desc "Sends sms notification to employees asking them to log if they have a overtime_request or not"
  task sms: :environment do
    # if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please log into the overtime management dashboard to request overtime or confirm your hours for last week: http://wlp-overtime-napper.herokuapp.com"
    
      employees.each do |employee|
        AuditLog.create!(user_id: employee.id)
        SmsTool.send_sms(number: employee.phone, message: notification_message)
      end
    # end
  end

  desc "Sends email notification to admin users each day to perform pending request"
  task manager_email: :environment do
    # iterate over the pending ot request 
    # check if there are any ovetime request
    # iterate over list of admin users
    # email list to admins
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.count > 0
        admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
        end
    end
  end

end
