def collatz(number)

  x = 1
  clltz = [0,0]

  until x > number

    n = x
    count = 1

    while n > 1
      if n % 2 == 0 then
        n = n / 2
      else
        n = (3 * n) + 1
      end 
      count += 1
    end

    if count > clltz[1]
      clltz = [x, count]
    end

    n += 1
    x += 1

  end
  
  return "The longest collatz sequence below " + number.to_s + " is " + clltz[0].to_s + " with " + clltz[1].to_s + " steps."

end

puts collatz(1000000)