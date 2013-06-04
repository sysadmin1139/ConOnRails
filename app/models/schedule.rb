class Schedule < ActiveRecord::Base
  attr_accessible :from, :name, :til

  has_many :positions
  validates :name, presence: true, uniqueness: true
  validates :from, presence: true
  validates :til, presence: true
end
