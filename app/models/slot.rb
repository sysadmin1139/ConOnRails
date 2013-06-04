class Slot < ActiveRecord::Base
  attr_accessible :from, :position_id, :until, :volunteer_id

  belongs_to :position
  belongs_to :volunteer
  validates :from, presence: true
  validates :til, presence: true
end
