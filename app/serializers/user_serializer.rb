class UserSerializer < ActiveModel::Serializer
  has_many :events
  attributes :id, :username, :first_name, :last_name
end
