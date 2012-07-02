require 'test_helper'

class ChatMessageTest < ActiveSupport::TestCase
  context "given a chat message" do
    setup do
      @cm = FactoryGirl.build :chat_message
      subject { @cm }
    end

    should belong_to :user
    should validate_presence_of :message
    should allow_value('a'* 50).for :message
    should_not allow_value('a'* 10001).for :message
  end

end
