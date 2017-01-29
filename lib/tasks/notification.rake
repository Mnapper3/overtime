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

end
