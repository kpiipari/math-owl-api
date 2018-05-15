class Player < ApplicationRecord
    has_many :additions
    has_many :substractions
    has_many :multiplies

   
    #def hello(name)
    #    puts "hello + #{name}"
    #end

end
