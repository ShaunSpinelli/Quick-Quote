require_relative 'quote_class'
require_relative 'travel_class'
require_relative 'methods'

jobs = Marshal.load File.read("job_types.txt")# import array from job_types.txt

# Main program starts here
loop do
    puts "Welcome to Quick Quote"
    puts "What would you like to do"
    puts "Enter 1 for New Quote"
    puts "Enter 2 to add a new Jobs type"
    puts "Enter 3 to exit"

    user_option = gets.to_i

    case user_option
    when 1
        quote_menu(jobs)
    when 2
        add_job(jobs)
    when 3
        break
    else
        puts "Wrong selection"
        puts "Enter 1, 2, 3"
    end
end