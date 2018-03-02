require_relative 'quote_class'
require_relative 'travel_class'
require_relative 'methods'

jobs = Marshal.load File.read("job_types.txt")# import array from job_types.txt

# Main program starts here
loop do
    puts "Welcome to Quick Quote".center(50)
    puts "**************************".center(50,"*")
    puts "What would you like to do ?".center(50)
    puts "Enter 1: New Quote".center(50)
    puts "Enter 2: Add a new job type".center(50)
    puts "Enter 3: Too edit job".center(50)
    puts "Enter 4: Exit".center(50)

    user_option = gets.to_i

    case user_option
    when 1
        quote_menu(jobs)
        system("clear")
    when 2
        add_job(jobs)
        system("clear")
    when 3
        edit_job(jobs)
    when 4
        jobs_converted = Marshal.dump(jobs)
        File.open("job_types.txt", "w") {|f| f.write(jobs_converted)} # write jobs to txt file
        break
    else
        puts "Wrong selection"
        puts "Enter 1, 2, 3"
    end
end