require 'mysql2'
require 'io/console'

# Function to establish a connection to the MySQL database
def connect_to_database
  Mysql2::Client.new(
    host: 'localhost',
    username: 'root',   
    password: '',       
    database: 'user_db'
  )
end

# Function to verify user credentials
def verify_user(email, password)
  client = connect_to_database

  # Query to find the user by email and password
  query = "SELECT * FROM users WHERE email = ? AND password = ? LIMIT 1"
  result = client.prepare(query).execute(email, password)

  # If user exists, return true, else false
  result.count > 0
end

# Main program
puts "User Login"
print "Email: "
email = gets.chomp

print "Password: "
password = STDIN.noecho(&:gets).chomp  # Hides the password input

puts "\nVerifying..."

if verify_user(email, password)
  puts "Login successful!"
else
  puts "Invalid email or password."
end
