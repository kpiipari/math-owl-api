class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :rank, :total_score
  has_many :additions
  has_many :substractions
  has_many :multiplies
end

