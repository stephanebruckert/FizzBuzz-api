module NumbersHelper

  MAX_OFFSET = HUNDRED_BILLION = 100000000000
  MAX_LIMIT = 200

  MIN_OFFSET = 1
  MIN_LIMIT = 1

  DEFAULT_OFFSET = 1
  DEFAULT_LIMIT = 100

  def validate_offset(offset)
    if offset
      if !(Integer(offset) rescue false)
        raise Exception, :not_integer
      end
      if (MIN_OFFSET..MAX_OFFSET).exclude? offset.to_i
        raise Exception, :offset_exceeded
      end
      offset.to_i
    else
      DEFAULT_OFFSET
    end
  end

  def validate_limit(limit)
    if limit
      if !(Integer(limit) rescue false)
        raise Exception, :not_integer
      end
      if (MIN_LIMIT..MAX_LIMIT).exclude? limit.to_i
        raise Exception, :limit_exceeded
      end
      limit.to_i
    else
      DEFAULT_LIMIT
    end
  end

  def check_boundaries(offset_plus_limit)
    if (MIN_OFFSET..MAX_OFFSET).exclude? offset_plus_limit
      raise Exception, :boundaries_exceeded
    end
  end

end
