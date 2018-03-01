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
def quote_menu(jobs_arr, job_name = '')

    loop do 
        if job_name == ''
            puts "Jobs List:"
            jobs_arr.each do |value| # print out list of jobs from array
                puts "#{value[:name]}"
            end
            puts "Enter Job" #need error handling here
            job_name = gets.chomp.capitalize
        end
            
        jobs_arr.each do |job| # check list for correct job
            if job.has_value?(job_name)
                puts "Enter Location"
                location = gets.chomp
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
        puts "The job '#{job_name}' does not exist. Would you like to creat this job? [Y/N]"
        if gets.downcase.chomp == "y"
            puts ""
            add_job(jobs_arr, job_name)
            return
        end
    end
end

#Option 2 Add Job
def add_job(jobs_arr, job_name = '')

    if job_name == ''
        puts "Enter Job name"
        job_name = gets.chomp.capitalize
    end    
    puts job_name
    puts "Enter materials cost"
    materials_cost = gets.to_i
    puts "Enter labour time"
    labour_time = gets.to_i

    jobs_arr.push({name: job_name, materials_cost: materials_cost, time: labour_time})
    jobs_converted = Marshal.dump(jobs_arr)
    File.open("job_types.txt", "w") {|f| f.write(jobs_converted)} # write jobs to txt file
    puts "#{job_name} Job Added"
    puts "Would you like to create quote? [Y/N]"
    if gets.downcase.chomp == "y"
        puts ""
        jobs_arr_updated = Marshal.load File.read("job_types.txt")
        quote_menu(jobs_arr_updated, job_name)
        return
    end
end

# Main program starts here
puts "Welcome to Quick Quote"
puts "What would you like to do"
puts "Enter 1 for New Quote"
puts "Enter 2 to add a new Jobs type"

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