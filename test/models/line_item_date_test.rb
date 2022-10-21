# == Schema Information
#
# Table name: line_item_dates
#
#  id         :bigint           not null, primary key
#  bid_id     :bigint           not null
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class LineItemDateTest < ActiveSupport::TestCase
  test "#previous_date returns the bid's previous date when it exitsts" do
    assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
  end

  test "#previous_date returns nil when the bid has no previous date" do
    assert_nil line_item_dates(:today).previous_date
  end
end
