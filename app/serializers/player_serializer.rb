class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :rank, :total_score
  has_many :additions
  has_many :subtractions
  has_many :multiplies
end

