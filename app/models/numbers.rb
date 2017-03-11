class Numbers
  attr_reader :numb

  def self.all(min, max)
    (min..max).map { |n| new(n) }
  end

  def self.one(number)
    new(number)
  end

  def initialize(number)
    @value = ''
    @value += 'Fizz' if number % 3 == 0
    @value += 'Buzz' if number % 5 == 0
    @value = @value.empty? ? number : @value
  end
end
