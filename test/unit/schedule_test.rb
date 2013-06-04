require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  context Schedule do
    should have_many :positions
    should validate_presence_of :name
    should validate_presence_of :from
    should validate_presence_of :til
    should validate_uniqueness_of :name
  end
end
