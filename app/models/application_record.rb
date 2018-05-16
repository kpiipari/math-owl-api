class ApplicationRecord < ActiveRecord::Base
  include GameExtension
  self.abstract_class = true
end
