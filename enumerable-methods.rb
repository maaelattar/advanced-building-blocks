module Enumerable
  def my_each
    for element in self
      yield element
    end
  end

  def my_each_with_index
    for index in 0..(length - 1)
      yield self[index], index
    end
  end

  def my_select
    my_arr = []
    my_each do |element|
      my_arr.push(element) if yield(element)
    end
    my_arr
  end

  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count(element = nil)
    counter = 0
    if element.nil? && !block_given?
      return length
    elsif !element.nil?
      return "Element doesn't exist" unless include?(element)
      my_each do |elem|
        counter += 1 if element == elem
      end
    else
      my_each do |element|
        counter += 1 if yield(element)
      end
  end
    counter
    end

  def my_map(procedure = nil)
    my_arr = []
    if !procedure.nil?
      my_each do |element|
        my_arr.push(procedure.call(element))
      end
    else
      my_each do |element|
        my_arr.push(yield(element))
      end
    end
    my_arr
  end

  def my_inject(memo = nil)
    my_each do |element|
      if memo.nil?
        memo = element.is_a?(Integer) ? 0 : ''
      end
      memo = yield(memo, element)
    end
    memo
  end
end

def multiply_els(arr)
  mult = arr.my_inject(1) do |acc, e|
    acc * e
  end
  mult
end
