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
class LineItemDate < ApplicationRecord
  has_many :line_items, dependent: :destroy
  
  belongs_to :bid

  validates :date, presence: true, uniqueness: { scope: :bid_id }

  scope :ordered, -> { order(date: :asc) }

  def previous_date
    bid.line_item_dates.ordered.where("date < ?", date).last
  end
end
