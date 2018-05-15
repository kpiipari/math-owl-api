class AdditionSerializer < ActiveModel::Serializer
  attributes :id, :rounds, :score, :time, :user_answer, :player_id
  belongs_to :player, serializer: PlayerSerializer
end
