class Player < ApplicationRecord
    has_many :additions, :substractions, :multiplies

end
