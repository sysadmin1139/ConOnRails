require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  context Position do
    should belong_to :schedule
    should have_many :slots
    should validate_presence_of :name
    should validate_uniqueness_of(:name).scoped_to(:schedule_id)
    should validate_presence_of :sequence
    should validate_numericality_of :sequence
    should_not allow_value(-1).for :sequence
    should validate_uniqueness_of(:sequence).scoped_to(:schedule_id)
  end
end
