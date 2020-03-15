# require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heap_sort(list)
  return [] if list.empty?
  return list if list.length == 1

  # build heap 
  heap = MinHeap.new()
  list.each do |node|
    heap.add(node)
  end 

  # tried doing it the way many others did but last test kept failing
  # so did it this way
  # then we order heap by comparing nodes
  sorted_list = []
  list.size.times do |node|
    last_node = heap.remove()
    if sorted_list.empty? 
      sorted_list.push(last_node)
    elsif last_node < sorted_list[-1]
      temp = sorted_list[-1]
      sorted_list[-1] = last_node
      sorted_list.push(temp)
    else 
      sorted_list.push(last_node)
    end 
  end 

  return sorted_list
end