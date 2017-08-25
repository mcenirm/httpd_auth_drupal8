1. Launch things
    ```console
    docker-compose -f stack.yml up
    ```

1. Install drupal
    1. http://0.0.0.0:8080
    1. Choose language
    1. _Standard_ installation profile
    1. Database configuration
        * Type: PostgreSQL
        * Name: postgres
        * Username: postgres
        * Password: example
        * (Advanced options)
        * Host: postgres
        * Port: 5432
    1. Configure site
        * Site name: example
        * Site email address: no-reply@example.com
        * Username: admin
        * Password: admin
        * Email address: admin@example.com
        * Default country: None
        * Default time zone: UTC
        * [x] Check for updates automatically
        * [ ] Receive email notifications

1. Configure roles and users
    1. Add team1
        * http://0.0.0.0:8080/admin/people/roles/add
        * Name: team1
    1. Add team2
        * http://0.0.0.0:8080/admin/people/roles/add
        * Name: team2
    1. Add user1
        * http://0.0.0.0:8080/admin/people/create
        * Email address: user1@example.com
        * Username: user1
        * Password: user1
        * Status: Active
        * Roles: team1
        * [ ] Notify user of new account
        * Picture: no file selected
        * [x] Personal contact form
        * Time zone: UTC
    1. Add user2
        * http://0.0.0.0:8080/admin/people/create
        * Email address: user2@example.com
        * Username: user2
        * Password: user2
        * Status: Active
        * Roles: team2
        * [ ] Notify user of new account
        * Picture: no file selected
        * [x] Personal contact form
        * Time zone: UTC
