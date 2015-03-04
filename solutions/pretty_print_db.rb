require 'sqlite3'

db = SQLite3::Database.open("demo.db")
db.execute("CREATE TABLE IF NOT EXISTS employees(name, department)")
db.execute("DELETE FROM employees")
db.execute("INSERT INTO employees(name, department) VALUES (?, ?)", ["Tim", "Engineering"])
db.execute("INSERT INTO employees(name, department) VALUES (?, ?)", ["Sarah", "Engineering"])
db.execute("INSERT INTO employees(name, department) VALUES (?, ?)", ["Sue", "Sales"])
db.execute("INSERT INTO employees(name, department) VALUES (?, ?)", ["John", "Sales"])
db.execute("INSERT INTO employees(name, department) VALUES (?, ?)", ["Sam", "HR"])

results = db.execute2("SELECT * FROM employees WHERE name LIKE ?", ["S%"])

col0_width = 0
col1_width = 0

results.each do |result|
  if result[0].length > col0_width
    col0_width = result[0].length
  end

  if result[1].length > col1_width
    col1_width = result[1].length
  end
end

first_row = true

results.each do |result|
  puts "#{result[0].ljust(col0_width)} | #{result[1].ljust(col1_width)}"

  if first_row
    puts "#{'-' * col0_width}-|-#{'-' * col1_width}"
    first_row = false
  end
end
