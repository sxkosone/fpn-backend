class User < ApplicationRecord
    has_many :users_events
    has_many :events, through: :users_events
    accepts_nested_attributes_for :events
end
