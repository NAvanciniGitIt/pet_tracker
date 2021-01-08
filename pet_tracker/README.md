# Pet Tracker

Pet Tracker is a super simple Sinatra application that allows user's to keep a list with various details on their pets.

## Usage && Installation

To use this application, first clone the repo then make sure to type $ bundle install in your terminal. After you've successfully installed all of the gems, run $ shotgun in your terminal and navigate to localhost:9393 on your desired browser to visit the app. From there you will be able to sign up and will be directed to the pet's page where you can add or view your pets. Should you feel the need to edit or delete a pet from your list, the necessary buttons are provided. Once you're done with the application you may log out and end the application by typing CTRL C which will turn off the server. Thanks for using! 

To user the Rakefile commands (in case you'd like a clean slate)
rake drop -- drops the schema and development file
rake migrations -- migrates all of the tables
rake reset_db -- Does all of the above and runs shotgun,, so you don't have to. 

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pet Tracker's project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pet_tracker/pet_tracker/blob/master/CODE_OF_CONDUCT.md).

