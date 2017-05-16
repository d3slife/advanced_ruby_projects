def bubble_sort(array)
  for outer_index in (0...array.length)
    right_boundary = array.length - outer_index - 1
    for inner_index in (0...right_boundary)
      if (array[inner_index] > array[inner_index + 1])
        array[inner_index], array[inner_index + 1] = array[inner_index + 1], array[inner_index]
      end
    end
  end
  p array
end

sample_array = [4, 3, 78, -2, 0, 20]
bubble_sort(sample_array)

def bubble_sort_by(array)
  sorted_array = []
  if (block_given?)
    for outer_index in (0...array.length)
      right_boundary = array.length - outer_index - 1
      for inner_index in (0...right_boundary)
        if (yield(array[inner_index], array[inner_index + 1]) > 0)
          array[inner_index], array[inner_index + 1] = array[inner_index + 1], array[inner_index]
        end
      end
    end
  else
    return sorted_array = bubble_sort(array)
  end
  p array
end

sample_array_strings = ["in_the_end", "crawling", "defy_you", "lost_in_the_woods", "with_me"]
bubble_sort_by(sample_array_strings) {|first, second| first.length - second.length}
