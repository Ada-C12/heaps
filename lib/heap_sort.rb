

# This method uses a heap to sort an array.
# Time Complexity: O(n * log m)?
# Space Complexity: O(n) ?
def heapsort(list)
  sorted_arr = []
  heap = MinHeap.new()
  list.each do |value|
    heap.add(value, value)
  end 

list.length.times do |i|
  min = heap.remove()
  sorted_arr.push(min)
end 
return sorted_arr
end