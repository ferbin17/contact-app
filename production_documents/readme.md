# Production Instruction
Nginx and RVM is necessary for this production set up work

- Precompile assets for production by below commands
    ```
      RAILS_ENV=production rails assets:clobber
      RAILS_ENV=production rails assets:precompile
    ```

- Setting up puma
    - Copy the puma from 'production documents' folder to config instead of current one
    - Replace 'path-to-my_app' with absolute path of project (1 occurance)
    - Run the below command from project root
    ```
        mkdir -p shared shared/log shared/sockets shared/pids
    ```
-  Setting up service
    - Copy my_app.service to /etc/systemd/system
    - Replace 'deploy' with non-privileged user
    - Replace 'path-to-my_app' with absolute path of project (3 occurances)
    - Replace 'gemset-name' with gemset used (1 occurance)
    - Run the below commands to start service
    ```
        systemctl daemon-reload
        systemctl enable my_app.service
        systemctl start my_app.service
    ```
    - Use the below commands to restart/stop service
    ```
        systemctl restart my_app.service
        systemctl stop my_app.service
    ```
    
- Nginx
    - Replace 'path-to-my_app' with absolute path of project (2 occurances)
    - Replace 'domain-name' with the domain (1 occurance)
    - Include 'my_app.conf' in nginx.conf file
