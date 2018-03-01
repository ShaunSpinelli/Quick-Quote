require_relative 'quote_class'
require_relative 'travel_class'

jobs = Marshal.load File.read("job_types.txt")# import array from job_types.txt


#writes qoute to txt file and displays quote
def get_quote(job, location)
    puts "Get quote method"
    puts job
    puts location
end


# Option 1 Get Quote menu main logic done just need to intergrate qoutes
def quote_menu(jobs_arr)
    created = nil

    puts "Enter Location"
    location = gets.chomp
    puts "Jobs List:"
    
    loop do 
        jobs_arr.each do |value| # print out list of jobs from array
            puts "#{value[:name]}"
        end

        puts "Enter Job" #need error handling here
        input_job = gets.chomp.capitalize
        
        jobs_arr.each do |job| # check list for correct job
            if job.has_value?(input_job)
                puts "What is your email"
                email = gets.chomp
                puts "Whats is your cell number including"
                print "+61"
                phone = gets
                contact_arr = [phone,email]
                puts contact_arr
                trip = Travel.new(location)
                distance_cost =trip.travel_cost
                puts distance_cost
                puts "quote done"                
                quote = Quote.new(job, distance_cost, location, contact_arr)
                quote.text_quote
                quote.email_quote
                return trip                               
            end       
        end
        puts "No Job found, Try again"
    end
end

#Option 2 Add Job
def add_job(jobs_arr)

    puts "Enter Job title"
    job_name = gets.chomp.capitalize
    puts job_name
    puts "Enter materials cost"
    materials_cost = gets.to_i
    puts "Enter labour time"
    labour_time = gets.to_i

    jobs_arr.push({name: job_name, materials_cost: materials_cost, time: labour_time})
    jobs_converted = Marshal.dump(jobs_arr)
    File.open("job_types.txt", "w") {|f| f.write(jobs_converted)} # write jobs to txt file
    puts "#{job_name} Job Added"
    
end

# Main program starts here
puts "Welcome to Quick Quote"
puts "What would you like to do"
puts "Enter 1 for New Quote"
puts "Enter 2 too add a new Jobs type"

user_option = gets.to_i

case user_option
when 1
    quote_menu(jobs)
when 2
    add_job(jobs)
else
    puts "Wrong selection"
    puts "Enter 1 or 2"
end