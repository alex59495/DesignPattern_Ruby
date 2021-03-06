# External Iterator

class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end
  def has_next?
    @index < @array.length
  end
  def item
    @array[@index]
  end
  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

def merge(array1, array2)
  merged = []
  iterator1 = ArrayIterator.new(array1)
  iterator2 = ArrayIterator.new(array2)
  while( iterator1.has_next? and iterator2.has_next? )
    if iterator1.item < iterator2.item
      merged << iterator1.next_item
    else
      merged << iterator2.next_item
    end
  end
  # Pick up the leftovers from array1
  while( iterator1.has_next?)
    merged << iterator1.next_item
  end
  # Pick up the leftovers from array2
  while( iterator2.has_next?)
    merged << iterator2.next_item
  end
  merged
end

# Usiing Enumerable

class Account
  attr_accessor :name, :balance
  def initialize(name, balance)
    @name = name
    @balance = balance
  end
  def <=>(other)
    balance <=> other.balance
  end
end

  class Portfolio
  include Enumerable
  def initialize
    @accounts = []
  end
  def each(&block)
    @accounts.each(&block)
  end
  def add_account(account)
    @accounts << account
  end
end