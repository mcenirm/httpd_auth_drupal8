
!!! Update readme to address _httpd_ instead of _proftpd_ !!!

# Goal

**Q**.: Will ~~proftpd~~'s mod_sql authenticate using Drupal 8 users?

**A**.: Almost

The [SQL queries](http://www.proftpd.org/docs/contrib/mod_sql.html#SQLNamedQuery) in [`proftpd.conf`](proftpd/proftpd.conf)) work fairly well with the `users_field_data` and `user__roles` tables from Drupal 8's *Standard* profile. The demonstrated approach to numeric `gid` values is unsafe. Of course, this whole effort is fragile since the database structure of Drupal 8's persistent PHP classes should not be exposed directly.

However, proftpd does not support the [password hash scheme](https://api.drupal.org/api/drupal/core%21lib%21Drupal%21Core%21Password%21PhpassHashedPassword.php/class/PhpassHashedPassword/8.3.x) used by Drupal 8. That is, the `$S$` markers are unrecognized by both `mod_sql`'s default [password types](http://www.proftpd.org/docs/contrib/mod_sql.html#SQLAuthTypes) and [`mod_sql_passwd`](http://www.proftpd.org/docs/contrib/mod_sql_passwd.html)'s expanded set.


# Missing pieces

Add support to `mod_sql_passwd`, or creating a new module, for the [portable PHP password hashing framework](http://www.openwall.com/phpass/), which seems to be the basis for Drupal 8's password hash.

Identify an API within Drupal 8 that lets external services authenticate users, and implement a new proftpd module that uses that API and reasonably maps Drupal roles to the required group fields.


# Alternative approaches

Migrate account responsibilities to a dedicated service (eg, LDAP) and have both Drupal and proftpd authenticate against the same source.


# Steps

1. Launch things
    ```console
    docker-compose build httpd && docker-compose up httpd
    ```

1. Verify access
    ```console
    ./test_access
    ```

Test results should be empty showing that all tests passed. If there are problems, then it will show the expected response code, actual response code, user, and URL attempted.

# TODO involve these steps too

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
