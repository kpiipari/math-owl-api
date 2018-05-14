class SubtractionSerializer < ActiveModel::Serializer
  attributes :id, :rounds, :score, :time, :user_answer
  belongs_to :player, serializer: PlayerSerializer
end
