Overtime App

Key requirement: company needs documentation that salaried employees did or did not get overtime each week

Models
x  Post -> date:date rationale:text 
x User -> Devise 
x AdminUser -> STI
- Audit_log

Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input, inagrate with heroku scheduling
x Administrate admin dashboard
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime
x block none admin and guest users in admin

UI:
x Bootstrap -> formatting


x refactor posts/_form for admin user w/ status
