# Contact App
Simple conatct app to that accept and store message and mail details of message to a specific mail.

# Prerequisite
- RVM (Recommended, Optional)
- Ruby (3.0.0)
- Mysql/MariaDB
- Install libmysqlclient-dev by below command
  ```
      sudo apt install libmysqlclient-dev
  ```

# Installation
- #### Set up Rails app
    -  Install the gems required by the application:
        ```
            bundle install
        ```
    - Setup database.yml
        change default username, password as per requirement

    - Rename master.key.example in config folder to master.key and run the below commands:
        ```
            EDITOR="vim" rails credentials:edit
        ```
        Replace the username, password under database with username and password of production database (only for production setup)
        Replace the username, password under email with mail id and password for mailer
        Change the smtp configuration in all enviroments if not using gmail for mailer
        
    - Execute the database migrations/schema setup:
        ```
            rake db:setup
        ```
        
    - Precompile assets by the below command
        ```
            rake assets:precompile
        ```
    
    - Start the server
        ```
            rails s
        ```
- #### Production setup
    For production setup, follow the readme.md in production documents folder after executing database migrations/schema setup
    Don't forget to give username and password of production database in credentials. 
