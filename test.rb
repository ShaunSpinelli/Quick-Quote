# jobs = [
#     {name:"Small shed", materials_cost: 100, time: 45}, # read and create array of jobs from txt using marshall
#     {name:"Big shed", materials_cost: 100, time: 45}
# ]

# jobs_converted = Marshal.dump(jobs)
# File.open("job_types.txt", "w") {|f| f.write(jobs_converted)} # may ned to change to "a"

# job_read = Marshal.load File.read("job_types.txt")

# puts job_read[0][:name]
require_relative 'test2'

show



