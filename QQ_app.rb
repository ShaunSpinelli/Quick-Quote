require 'geocoder'
require_relative 'quote_class'
require_relative 'travel_class'

jobs = Marshal.load File.read("job_types.txt")# import array from job_types.txt


#writes qoute to txt file and displays quote
def get_quote(job, location)
    puts "Get quote method"
    puts job
    puts location
end


# Option 1 Get Quote menu
def quote_menu(jobs_arr)
    puts "Enter Location"
    location = gets.chomp
    puts "Jobs List:"
    jobs_arr.each do |value| # print out list of jobs from array
        puts "#{value[:name]}"
    end

    while input_job == # need condotion to break loop if job has quote has been done
        puts "Enter Job" #need error handling here
        input_job = gets.chomp.capitalize
        
        jobs_arr.each do |job| # check list for correct job
            if job.has_value?(input_job)           
                email = "" # change
                trip = Travel.new(location)
                
                distance_cost =trip.travel_cost
                puts distance_cost
                puts "quote done"
                #quote = Quote.new(job,distance_cost,location,email) # change to contact info pass as array
                #quote.text_quote
                break
                # #qoute.email
                # get_quote(job, location)                
                
            end
            
        end
        puts "didnt include"
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