# Introduction
  - This project is a rails blogging application with token based authentication.
  - The user can have three roles:
    - Admin
    - Reader
    - Writer
  - Each user can have multiple roles.
  - The user can login and logout.
  
  ## Admin
     Admin can manage users.
     Can manage categories.
     Can manage blogs.
 ## Reader
    Can read the blogs.
 ## Writer 
    Can manage his own blogs.

# What is Token Based Authentication?
  Token-based authentication is a protocol which allows users to verify their identity, and in return receive a unique access token. ... Auth tokens work like a stamped ticket. The user retains access as long as the token remains valid. Once the user logs out or quits an app, the token is invalidated.
  
# Ruby version and Rails version 
Ruby '3.0.0' and Rails '6.1.1'

# How to run on local host?
Change the current working directory to the directory where you want to clone.
Clone the project using command:
  - git clone https://github.com/sakshijain20/blogging_application.git
  - "bundle install" to add the required dependencies.
  - Run "rake db:migrate" to migrate the database.
  - Run "rails s" to run the project on local host.
  
 Hit the url shown here after hitting the last command and you will be landed to root page.
 To run the application as admin :
 Username : sakshi jain
 Password: 12345678
   

