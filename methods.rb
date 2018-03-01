# Option 1 Get Quote menu main
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
                puts "Whats is your cell number"
                print "+61"
                phone = gets.chomp
                puts "Quote being processed need four stars "
                print "*"
                contact_arr = [phone,email]
                trip = Travel.new(location)
                print "*"
                distance_cost =trip.travel_cost
                #puts distance_cost
                quote = Quote.new(job, distance_cost, location, contact_arr)
                quote.write_quote
                quote.text_quote
                print "*"
                quote.email_quote
                puts "*"
                puts "Quote sent" 
                puts "Press Enter for main menu"
                gets              
                return                               
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

#Option 2 Add Job main menu
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