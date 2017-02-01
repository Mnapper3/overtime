Overtime App

Key requirement: company needs documentation that salaried employees did or did not get overtime each week

Models
x  Post -> date:date rationale:text 
x User -> Devise 
x AdminUser -> STI
- Audit_log

Features:
x Approval Workflow
- SMS Sending -> link to approval or overtime input, inagrate with heroku scheduling
x Administrate admin dashboard
x Email summary to managers for approval
- Needs to be documented if employee did not log overtime
x block none admin and guest users in admin
x audit log for sms and emails
- update buttons on employee homepage (don't fit mobile)
- add full date range on empoloyee hopmepage buttons for week of, update button sort order
- admin user should have entry's of request ot in navbar
- bug in admin dashboard / nav
- implement honeybadger
- implement new relic to speed up app on heroku

UI:
x Bootstrap -> formatting


x refactor posts/_form for admin user w/ status
