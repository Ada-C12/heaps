require_relative "max_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(1)
def heap_sort(list)
  max_heap = build_max_heap(list)
  
  i = list.length - 1

  until i < 0
    list[i] = max_heap.remove
    i -= 1
  end

  return list
end


def build_max_heap(list)
  return list if list.empty?

  max_heap = MaxHeap.new
  
  list.each do |val|
    max_heap.add(val)
  end

  return max_heap
end
