class BaseBuilder
  def built_bid
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def built_line_item_date
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def built_line_item
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end