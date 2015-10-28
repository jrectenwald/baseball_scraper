class Inning < ActiveRecord::Base
  belongs_to :game
  has_many :at_bats
end