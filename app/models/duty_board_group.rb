# == Schema Information
#
# Table name: duty_board_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  row        :integer
#  column     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DutyBoardGroup < ActiveRecord::Base
  attr_accessible :name, :row, :column
  audited

  ROW_RANGE = (1..4)
  COL_RANGE = (1..2)

  has_many :duty_board_slots, order: :name
  validates_presence_of :name, :row, :column
  validates_uniqueness_of :name
  validates_uniqueness_of :row, scope: :column
  validates_numericality_of :row, :column
  validates_inclusion_of :row, in: ROW_RANGE
  validates_inclusion_of :column, in: COL_RANGE

  def self.row_range
    ROW_RANGE
  end

  def self.col_range
    COL_RANGE
  end
end
