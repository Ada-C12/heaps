

# This method uses a heap to sort an array.
# Time Complexity:  O(n) + O(nlogn) = O(nlogn)??
# Space Complexity: O(1)
def heapsort(list)
  return list if list.length <= 1

  # build a max heap
  list.length.times do |i|
    heap_up(list, i)
  end

  last = list.length - 1

  # pop off the top of the heap
  # place it in the last unsorted slot
  # re-heap the unsorted list
  list.length.times do |i|
    swap(list, 0, last)
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
    heap_up(list, parent_index)
  end

  return
end

def heap_down(list, index, last)
  return if index == last - 1

  index_1 = 2 * index + 1
  index_2 = 2 * index + 2
  return if index_1 > last - 1

  larger_child_index = find_larger_child_index(list, index_1, index_2, last)

  if list[index] < list[larger_child_index]
    swap(list, index, larger_child_index)
    heap_down(list, larger_child_index, last)
  end

  return
end

def find_smaller_child_index(index_1, index_2) 
  return index_1 if index_2 > @store.length - 1

  if @store[index_1].key <= @store[index_2].key
    return index_1
  end

  return index_2
end

def find_larger_child_index(list, index_1, index_2, last)
  return index_1 if index_2 > last - 1

  if list[index_1] >= list[index_2]
    return index_1
  end

  return index_2
end

