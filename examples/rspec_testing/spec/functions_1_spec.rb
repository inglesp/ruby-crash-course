require 'rspec'
require 'functions_1'

describe "abs" do
  it "returns the same value back with a positive input" do
    expect(Functions1.abs(10)).to eq(10)
  end

  it "returns the positive value of a negative input" do
    expect(Functions1.abs(-10)).to eq(10)
  end

  it "returns 0 with a 0 input" do
    expect(Functions1.abs(0)).to eq(0)
  end
end

describe "square" do
  it "returns the input multipled by itself" do
    expect(Functions1.square(10)).to eq(100)
    expect(Functions1.square(-10)).to eq(100)
    expect(Functions1.square(0)).to eq(0)
  end
end

describe "add_2" do
  it "adds two numbers together" do
    expect(Functions1.add_2(10, 20)).to eq(30)
  end
end

describe "add_3" do
  it "adds three numbers together" do
    expect(Functions1.add_3(10, 20, 30)).to eq(60)
  end
end

describe "min_2" do
  it "returns the minimum of 2 numbers" do
    expect(Functions1.min_2(10, 20)).to eq(10)
    expect(Functions1.min_2(20, 10)).to eq(10)
  end
end

describe "min_3" do
  it "returns the minimum of 3 numbers" do
    expect(Functions1.min_3(10, 20, 30)).to eq(10)
    expect(Functions1.min_3(30, 20, 10)).to eq(10)
    expect(Functions1.min_3(30, 20, 10)).to eq(10)
  end
end

describe "avg_2" do
  it "returns the average of 2 numbers" do
    expect(Functions1.avg_2(10, 20)).to eq(15)
    expect(Functions1.avg_2(10, 10)).to eq(10)
    expect(Functions1.avg_2(10, -10)).to eq(0)
    expect(Functions1.avg_2(10, 11)).to eq(10.5)
  end
end

describe "avg_2" do
  it "returns the average of 3 numbers" do
    expect(Functions1.avg_3(10, 20, 30)).to eq(20)
    expect(Functions1.avg_3(10, 10, 10)).to eq(10)
    expect(Functions1.avg_3(10, 0, -10)).to eq(0)
    expect(Functions1.avg_3(10, 10, 11)).to eq(10 + 1.0 / 3)
  end
end

describe "factorial" do
  it "returns the factorial of the input number" do
    expect(Functions1.factorial(1)).to eq(1)
    expect(Functions1.factorial(2)).to eq(2)
    expect(Functions1.factorial(3)).to eq(6)
    expect(Functions1.factorial(4)).to eq(24)
  end
end

describe "fib" do
  it "returns the fibonacci number at the given point in the sequence" do
    expect(Functions1.fib(0)).to eq(1)
    expect(Functions1.fib(1)).to eq(1)
    expect(Functions1.fib(2)).to eq(2)
    expect(Functions1.fib(3)).to eq(3)
    expect(Functions1.fib(4)).to eq(5)
    expect(Functions1.fib(5)).to eq(8)
  end
end
