class BaseBuilder
  def built_bid
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end