class BidDecorator < Draper::Decorator
  delegate_all
  
  def name
    object.name + " (#{object.line_item_dates.size})"
  end
end
