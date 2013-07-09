class RomanNumeral
  def initialize(number)
    @number = number
  end

  def +(other)
  end

  def to_s
    @number
  end

  def inspect
    to_s
  end

  def to_roman
    self
  end
end
