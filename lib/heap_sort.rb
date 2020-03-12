

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heap_sort(list)
  # this should build the heap
  list.length.times do |i|
    heap_up(list, i)
  end

  # pop of the top of the heap
  # place it in the last slot
  # re-heap

  last = list.length - 1

  list.length.times do |i|
    swap(0, last)
    heap_down(list, 0, last)

    last -= 1
  end

  return list
end

def swap(list, index_1, index_2)
  temp = list[index_1]
  list[index_1] = list[index_2]
  list[index_2] = temp
end

def heap_up(list, index)
  return if index == 0

  parent_index = (index - 1)/2

  if list[index] > list[parent_index]
    swap(list, index, parent_index)      
    heap_up(parent_index)
  end

  return
end

def heap_down(list, index, last)
  return if index == last - 1

  larger_child_index = find_larger_child_index((2 * index + 1), (2 * index + 2))

  if list[index] < list[larger_child_index]
    swap(index, larger_child_index)
    heap_down(larger_child_index)
  end

  return
end

def find_larger_child_index(index_1, index_2)
  if @store[index_1].key >= @store[index_2].key
    return index_1
  end

  return index_2
end

