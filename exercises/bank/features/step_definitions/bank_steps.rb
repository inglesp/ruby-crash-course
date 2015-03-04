Before do
  `ruby bank.rb reset`
end

Given('a new account for $name') do |name|
  `ruby bank.rb create #{name}`
end

When('$name deposits $amount') do |name, amount|
  `ruby bank.rb deposit #{name} #{amount}`
end

When('$name withdraws $amount') do |name, amount|
  `ruby bank.rb withdraw #{name} #{amount}`
end

When('$name1 transfers $amount to $name2') do |name1, amount, name2|
  `ruby bank.rb transfer #{name1} #{name2} #{amount}`
end

Then('$name should have a balance of $amount') do |name, amount|
  output = `ruby bank.rb balance #{name}`
  assert_equal("#{name} has balance #{amount}", output.strip)
end
