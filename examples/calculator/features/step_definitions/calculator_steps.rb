Given('the input "$input"') do |input|
  @input = input
end

Given('the numbers "$input1" and "$input2"') do |input1, input2|
  @input1 = input1
  @input2 = input2
end

When('the calculator is run') do
  @output = `ruby calculator.rb "#{@input}"`
end

When('I $operation them in the calculator') do |operation|
  if operation == 'add'
    input = "#{@input1} + #{@input2}"
  elsif operation == 'subtract'
    input = "#{@input1} - #{@input2}"
  else
    raise "Don't know how to handle #{operation}"
  end

  @output = `ruby calculator.rb "#{input}"`
end

Then('the output should be "$output"') do |output|
  assert_equal(output, @output.strip)
end
