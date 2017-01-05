class User < ActiveRecord::Base
  has_many :attendees
  has_many :meetups, through: :attendees

  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.provider = provider
      user.uid = uid
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar_url = auth.info.image
    end
  end

  def is_in_meetup(meetup_id)
    is_in = self.meetups.select { |n| n.id == meetup_id }
    !is_in.empty?
  end

end
