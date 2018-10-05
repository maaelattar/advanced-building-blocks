def bubble_sort(arr)
  loop until arr.each_cons(2).with_index.none? do |(x, y), i|
    if x > y
      arr[i] = y
      arr[i + 1] = x
    end
  end
  arr
end

def bubble_sort_by(arr)
  arr.each_cons(2).with_index do |(left, right), index1|
    result = yield(left, right)
    if result > 0
      arr[index1] = right
      arr[index1 + 1] = left
    end
  end
  arr
end

puts bubble_sort([9, 5, 7, 1, 3, 6, 5, 10, 77])

result = bubble_sort_by(%w[hi hello hey]) do |left, right|
  left.length - right.length
end
puts result
