# == Schema Information
#
# Table name: line_items
#
#  id                :bigint           not null, primary key
#  line_item_date_id :bigint           not null
#  name              :string           not null
#  description       :text
#  quantity          :integer          not null
#  unit_price        :decimal(10, 2)   not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  test "#total_price returns the total price of the line item" do
    assert_equal 250, line_items(:catering_today).total_price
  end
end
