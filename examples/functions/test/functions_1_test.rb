require 'minitest/autorun'
require 'functions_1'

class Functions1Tests < Minitest::Test
  def test_abs
    assert_equal(10, Functions1.abs(10))
    assert_equal(10, Functions1.abs(-10))
    assert_equal(0, Functions1.abs(0))
  end

  def test_square
    assert_equal(100, Functions1.square(10))
    assert_equal(100, Functions1.square(-10))
    assert_equal(0, Functions1.square(0))
  end

  def test_add_2
    assert_equal(30, Functions1.add_2(10, 20))
  end

  def test_add_3
    assert_equal(60, Functions1.add_3(10, 20, 30))
  end

  def test_min_2
    assert_equal(10, Functions1.min_2(10, 20))
    assert_equal(10, Functions1.min_2(20, 10))
  end

  def test_min_3
    assert_equal(10, Functions1.min_3(10, 20, 30))
    assert_equal(10, Functions1.min_3(30, 10, 20))
    assert_equal(10, Functions1.min_3(20, 30, 10))
    assert_equal(10, Functions1.min_3(30, 20, 10))
    assert_equal(10, Functions1.min_3(10, 30, 20))
    assert_equal(10, Functions1.min_3(20, 10, 30))
  end

  def test_avg_2
    assert_equal(15, Functions1.avg_2(10, 20))
    assert_equal(10, Functions1.avg_2(10, 10))
    assert_equal(0, Functions1.avg_2(10, -10))
    assert_equal(10.5, Functions1.avg_2(10, 11))
  end

  def test_avg_3
    assert_equal(20, Functions1.avg_3(10, 20, 30))
    assert_equal(10, Functions1.avg_3(10, 10, 10))
    assert_equal(0, Functions1.avg_3(10, 0, -10))
    assert_equal(10 + 1.0 / 3, Functions1.avg_3(10, 10, 11))
  end

  def test_factorial
    assert_equal(1, Functions1.factorial(1))
    assert_equal(2, Functions1.factorial(2))
    assert_equal(6, Functions1.factorial(3))
    assert_equal(24, Functions1.factorial(4))
  end

  def test_fib
    assert_equal(1, Functions1.fib(0))
    assert_equal(1, Functions1.fib(1))
    assert_equal(2, Functions1.fib(2))
    assert_equal(3, Functions1.fib(3))
    assert_equal(5, Functions1.fib(4))
    assert_equal(8, Functions1.fib(5))
  end
end

