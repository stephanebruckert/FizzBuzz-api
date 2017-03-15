class Numbers
  include ActiveModel::SerializerSupport
  attr_accessor :id, :value

  def self.all(min, max)
    (min..max).map { |n| new(n) }
  end

  def initialize(number)
    @id = number
    @value = ''
    @value += 'Fizz' if number % 3 == 0
    @value += 'Buzz' if number % 5 == 0
    @value = @value.empty? ? number : @value
  end

end
