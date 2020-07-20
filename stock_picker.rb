def stock_picker(arr)
  max_profit = [nil, nil, 0]
  arr.each_with_index do |i, idx_i|
    arr[idx_i, arr.length].each_with_index do |j, idx_j|
      max_profit = [idx_i, idx_j + idx_i, j - i] if j - i > max_profit.last
    end
  end
  max_profit[0, 2]
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# => [1,4]  # for a profit of $15 - $3 == $12
