def merge_sort(arr)
  length = arr.length

  # if there's a single element, return it
  return arr if length < 2

  # slice array in half
  slice1 = arr[0, length / 2]
  slice2 = arr[length / 2, length]

  # sort each half
  slice1 = merge_sort(slice1)
  slice2 = merge_sort(slice2)

  merged_array = []

  # merge each half
  until slice1.empty? || slice2.empty?
    merged_array << if slice1.first < slice2.first
                      slice1.shift
                    else
                      slice2.shift
                    end
  end
  merged_array << slice1
  merged_array << slice2
  merged_array.flatten!
end
