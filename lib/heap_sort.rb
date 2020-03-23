require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  o((n * log n) + (n * log n)) => o(n log n) | it depends on the length of the list, but adding and removing from the list takes log(n), and the removal of each takes log(n) as well, and has to happen n times (the length of the list)
# Space Complexity: also o(n log n)
def heapsort(list)
  return list if list.empty?
  sorting_heap = MinHeap.new

  list.each do |e|
    sorting_heap.add(e)
  end

  new_list = []

  until sorting_heap.empty? do
    new_list << sorting_heap.remove
  end

  return new_list

end