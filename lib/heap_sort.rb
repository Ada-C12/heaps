require_relative "./min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  array = []
  myHeap = MinHeap.new()
  #return  myHeap.store
  list.each do |item|
    myHeap.add(item)
    puts item 
  end

  until myHeap.empty?
    array << myHeap.remove()
  end
  return  array
end