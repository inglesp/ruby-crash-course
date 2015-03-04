require 'sqlite3'

def get_db
  db = SQLite3::Database.open "bank.db"
  db.execute("CREATE TABLE IF NOT EXISTS accounts(name UNIQUE, balance)")
  db
end

def create(account)
  db = get_db
  db.execute("INSERT INTO accounts(name, balance) VALUES (?, ?)", [account, 0])
end

def balance(account)
  db = get_db
  results = db.execute("SELECT * FROM accounts WHERE name = ?", [account])
  balance = results[0][1]
  puts "#{account} has balance #{balance}"
end

def deposit(account, amount)
  db = get_db
  db.execute("UPDATE accounts SET balance = balance + ? WHERE name = ?", [amount, account])
end

def withdraw(account, amount)
  db = get_db
  db.execute("UPDATE accounts SET balance = balance - ? WHERE name = ?", [amount, account])
end

def transfer(from_account, to_account, amount)
  withdraw(from_account, amount)
  deposit(to_account, amount)
end

def reset
  db = get_db
  db.execute("DELETE FROM accounts;")
end

if ARGV[0] == 'create'
  create(ARGV[1])
elsif ARGV[0] == 'balance'
  balance(ARGV[1])
elsif ARGV[0] == 'deposit'
  deposit(ARGV[1], ARGV[2].to_i)
elsif ARGV[0] == 'withdraw'
  withdraw(ARGV[1], ARGV[2].to_i)
elsif ARGV[0] == 'transfer'
  transfer(ARGV[1], ARGV[2], ARGV[3].to_i)
elsif ARGV[0] == 'reset'
  reset()
end
