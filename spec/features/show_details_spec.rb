require 'spec_helper'

feature "Page with details" do

  let! (:meetup) { Meetup.create(time: 'noon', duration: '1 hour', name: 'lunch', location: 'board room', date: '2017/11/11', description: 'a delicious lunch') }

  scenario "page shows time" do
    visit '/meetups/'+ meetup.id.to_s


    expect(page).to have_content "noon"
  end
  scenario "page shows location" do
    visit '/meetups/'+ meetup.id.to_s


    expect(page).to have_content "board room"
  end
  scenario "page shows name" do
    visit '/meetups/'+ meetup.id.to_s


    expect(page).to have_content "lunch"
  end
end
