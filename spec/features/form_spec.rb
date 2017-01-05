require 'spec_helper'

feature "make a new meetup" do

  let! (:meetup) { Meetup.create(time: 'noon', duration: '1 hour', name: 'lunch', location: 'board room', date: '2017/11/11', description: 'a delicious lunch') }

  scenario "page shows time" do
    visit '/new'
    expect(page).to have_content "Make a new meetup"
  end

end
