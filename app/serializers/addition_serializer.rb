class AdditionSerializer < ActiveModel::Serializer
  attributes :id, :rounds, :score, :time, :user_answer
end
