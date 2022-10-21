# == Schema Information
#
# Table name: bids
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
require "test_helper"

class BidTest < ActiveSupport::TestCase
  test "#total_price returns the sum of the total price of all line items" do
    assert_equal 2500, bids(:first).total_price
  end
end
