class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name
  has_many :books
end
