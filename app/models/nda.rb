class Nda < ApplicationRecord


  attr_accessor :nda
  validates :nda, :acceptance => {:message => 'must be accepted' }

end
