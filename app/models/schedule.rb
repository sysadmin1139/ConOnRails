class Schedule < ActiveRecord::Base
  attr_accessible :from, :name, :until

  has_many :positions
  validates :name, presence: true, uniqueness: true
  validates :from, presence: true
  validates :until, presence: true
end
