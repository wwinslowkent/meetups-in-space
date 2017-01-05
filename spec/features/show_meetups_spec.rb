require 'spec_helper'

feature "Page with all meetups" do

  let! (:meetup) { Meetup.create(time: 'noon', duration: '1 hour', name: 'lunch', location: 'board room', date: '2017/11/11', description: 'a delicious lunch') }

  scenario "page shows meetups" do
    visit '/meetups'

    expect(page).to have_content "lunch"
  end
end
