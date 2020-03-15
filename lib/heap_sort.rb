

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  return [] if list == []
  return list if list.length == 1
  index = 1
  until index == list.length
    heap_up(list, index)
    index += 1
  end
  find_min(list)
  return list
end

def heap_up(list, index)
  # for right children
  if index % 2 == 0
    parent = (index - 2) / 2
    unless parent < 0
      if list[index] < list[parent]
        swap(list, index, parent)
        heap_up(list, parent)
      end
    end
  end
  # for left children
  if index % 2 == 1
    parent = (index - 1) / 2
    unless parent < 0
      if list[index] < list[parent]
        swap(list, index, parent)
        heap_up(list, parent)
      end
    end
  end
end

def swap(list, index_1, index_2)
  temp = list[index_1]
  list[index_1] = list[index_2]
  list[index_2] = temp
end

def find_min(list)
  return list[0] if list.length == 1
  temp = list[0]
  heap_down(list, 1)
  return temp + find_min(list[1...list.length])
end

def heap_down(list, index)
  if !list[index+1].nil? && list[index] > list[index+1]
    swap(list, index, index+1)
    heap_down(list, index+1)
  elsif !list[index+2].nil? && list[index] > list[index+2]
    swap(list, index, index+2)
    heap_down(list, index+2)
  end
end