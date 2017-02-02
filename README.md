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
x Needs to be documented if employee did not log overtime
x block none admin and guest users in admin
- update buttons on employee home so they fit in mobile
- full date range in employee\s home page 
- update the employee home poge button sort order
- update admin nav, rm entries and request buttons
- fix admin dashboard bug
- implement honeybadger for error reporting
- implemnet relic for heroku slow reloads
- 

UI:
x Bootstrap -> formatting


x refactor posts/_form for admin user w/ status
