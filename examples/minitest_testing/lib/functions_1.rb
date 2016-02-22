module Functions1
  extend self

  # This function returns the absolute value of its argument.
  def abs(x)
    if x < 0
      -x
    else
      x
    end
  end

  # This function returns its argument squared.
  def square(x)
    x * x
  end

  # This function returns the sum of its two arguments.
  def add_2(x, y)
    x + y
  end

  # This function returns the sum of its three arguments.
  def add_3(x, y, z)
    x + y + z
  end

  # This function returns the minimum of its two arguments.
  def min_2(x, y)
    if x < y
      x
    else
      y
    end
  end

  # This function returns the minimum of its three arguments.
  def min_3(x, y, z)
    if x < y and x < z
      x
    elsif y < x and y < z
      y
    else
      z
    end
  end

  # This function returns the average of its two arguments.
  def avg_2(x, y)
    (x + y) / 2.to_f
  end

  # This function returns the average of its three arguments.
  def avg_3(x, y, z)
    (x + y + z) / 3.to_f
  end

  # This function returns n factorial; that is, n * (n-1) * (n-2) * ... * 2 * 1
  def factorial(n)
    result = 1

    while n > 1
      result *= n
      n -= 1
    end

    result
  end

  # This function returns the nth Fibbonaci number.  Google for Fibbonaci's
  # sequence if you've not come across it before.
  def fib(n)
    a = 0
    b = 1

    while n > 0
      old_b = b
      b = a + b
      a = old_b
      n -= 1
    end

    b
  end
end
