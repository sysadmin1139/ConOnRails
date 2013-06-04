class Position < ActiveRecord::Base
  attr_accessible :name, :sequence

  belongs_to :schedule
  has_many :slots
  validates :name, presence: true, uniqueness: { scope: :schedule_id }
  validates :sequence, presence: true, numericality: { greater_than: 0 }, uniqueness: { scope: :schedule_id }
end
