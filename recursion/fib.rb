def fibs(values)
  ans = [0, 1]
  return ans[0, values] if values < 3

  values -= 2
  values.times.each { |i| ans << ans[i] + ans[i + 1] }
  ans
end

def fibs_rec(values)
  return [0, 1][0, values] if values < 3

  fib = fibs_rec(values - 1)
  fib << (fib[-1] + fib[-2])
end
