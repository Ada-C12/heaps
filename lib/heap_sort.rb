# This method uses a heap to sort an array.
# Time Complexity: O(nlogn)
# Space Complexity: O(1)
def heapsort(list)
  return list if list.length <= 1

  last = list.length - 1

  # build a max heap
  # must heap down and start from the back of the array
  # key for O(n) time
  list.length.times do |i|
    heapify(list, last - i, last)
  end

  # pop off the top of the heap
  # place it in the last unsorted slot
  # re-heap the unsorted list
  list.length.times do |i|
    last = list.length - 1 - i

    swap(list, 0, last)

    heapify(list, 0, last - 1)
  end

  return list
end

def swap(list, index_1, index_2)
  temp = list[index_1]
  list[index_1] = list[index_2]
  list[index_2] = temp
end

def heapify(list, index, last)
  while index < last
    index_1 = 2 * index + 1
    index_2 = 2 * index + 2

    return if index_1 > last

    larger_child_index = index_2

    if index_2 > last || list[index_1] > list[index_2]
      larger_child_index = index_1
    end

    if list[index] < list[larger_child_index]
      swap(list, index, larger_child_index)
      index = larger_child_index
    else
      return
    end
  end

  return
end

