# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
Meetup.create(time: 'noon', duration: '1 hour', name: 'lunch', location: 'board room', date: '2017/11/11', description: 'a delicious lunch')
User.create(provider: 'comcast', uid: '1', username: 'johnson', email: 'johnson@johnson.com', avatar_url: '/johnson.png')
