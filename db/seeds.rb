@user = User.create(email: "test@test.com", 
                    password: "asdfasdf", 
                    password_confirmation: "asdfasdf", 
                    first_name: "Jon", 
                    last_name: "Snow", 
                    phone: "5747424510")

puts "1 user created"

AdminUser.create(email: "admintest@test.com", 
                        password: "asdfasdf",
                        password_confirmation: "asdfasdf", 
                        first_name: "Admin", 
                        last_name: "Snow", 
                        phone: "5747424510")

puts "1 Admin User created"

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui dicta minus molestiae vel beatae natus eveniet ratione temporibus aperiam harum alias officiis assumenda officia quibusdam deleniti eos cupiditate dolore doloribus!</p>
<p>Ad dolore dignissimos asperiores dicta facere optio quod commodi nam tempore recusandae. Rerum sed nulla eum vero expedita ex delectus voluptates rem at neque quos facere sequi unde optio aliquam", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"

AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 20.days))

puts "3 audit logs have been created"