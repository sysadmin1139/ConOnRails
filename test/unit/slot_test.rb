require 'test_helper'

class SlotTest < ActiveSupport::TestCase
  context Slot do
    should belong_to :position
    should belong_to :volunteer
    should validate_presence_of :from
    should validate_presence_of :until
  end
end
