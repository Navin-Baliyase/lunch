# lunch
Rails application where employee can suggest for lunch places and manger can finalize the place for Team Lunch with email alerts.

* Ruby - 2.4.0
* Rails - 5.0.7

## installation
1. Clone the application : git clone https://github.com/Navin-Baliyase/lunch
2. bundle
3. rails db:migrate
4. rails db:seed
5. rails s
6. open in browser - localhost:3000


## gem used
* letter-opener : Preview email in the default browser instead of sending it
* faker : Dummy data creation
* bcrypt : Authentication


## concept used
* STI - Single Table Inheritance
Created a single model Employee

* ActiveModel has_secure_password
Used to encrypt password and authenticate user.

## Demo Link
* Demo link : https://drive.google.com/file/d/1rkOJlaIFPLoJY6_4K_Ca8CW9f3nqy6oa/view
