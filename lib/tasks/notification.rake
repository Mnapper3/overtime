namespace :notification do
  desc "Sends sms notification to employees asking them to log if they have a overtime_request or not"
  task sms: :environment do
    #1 shedule to run at 5pm on Sunday's
    #2 Iterate(loop through) over all employees - !admins
    #3 send instruction with a link to enter log overtime
  
    # User.all.each do |user|
    #   SmsTool.send_sms()
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
