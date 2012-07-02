class ChatMessage < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :message
  validates_length_of :message, maximum: 10000
end
