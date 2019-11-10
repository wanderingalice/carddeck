

  def recursive_fib(count)
    if count < 2
      count
    else
      recursive_fib(count - 1) + recursive_fib(count - 2)
    end
  end

  def iterative_fib(count)
    a = 0
    b = 1
    x = 0

    while x < count do
      c = a
      a = b
      b = c + a
      x += 1
    end
    return a
  end



puts iterative_fib(35)
puts recursive_fib(35)

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end