class EventSerializer < ActiveModel::Serializer
  has_many :users
  attributes :id, :description, :long, :lat, :address, :city,
  :country, :event_url, :name, :duration, :time, :group_name, :group_who,
  :meetup_id, :photo_url 


end
