# README

Backend to a mapping application which shows meetups events near you! Frontend github here: https://github.com/sxkosone/meetbyme and live version here: https://meet-by-me.herokuapp.com/

Project by Susanna Kosonen & [Will Ley](https://github.com/wley3337)

* Configuration & Deployment
1. Get your Meetup API key from Meetup: https://secure.meetup.com/meetup_api/key/
2. This project uses the [figaro gem](https://github.com/laserlemon/figaro) for environment variables, such as storing secret API keys. Add `gem "figaro"` to your Gemfile and run `bundle install`. Then run `bundle exec figaro install`. Here's how to add and use environment variables after this: https://github.com/laserlemon/figaro
3. Should you deploy to heroku, set your environment variables there too. You can set these with the following command: `heroku config:set MY_SECRET_KEY=12345` . Please read full instructions here: https://devcenter.heroku.com/articles/config-vars


* Database creation
This project runs on PostgreSQL. Once you have PostgreSQL installed and running, run `rake db:create` and `rake db:migrate`



