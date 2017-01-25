Overtime App

Key requirement: company needs documentation that salaried employees did or did not get overtime each week

Models
x  Post -> date:date rationale:text 
x User -> Devise 
x AdminUser -> STI

Features:
-Approval Workflow
-SMS Sending -> link to approval or overtime input
-Administrate admin dashboard
-Email summary to managers for approval
-Needs to be documented if employee did not log overtime
-block none admin and guest users in admin

UI:
x Bootstrap -> formatting

-refactor user assciation in post_spec.rb
- refactor posts/_form for admin user w/ status
- Fix Spec/Features/Post_spec.rb:82 to use factories