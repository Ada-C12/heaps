require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
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