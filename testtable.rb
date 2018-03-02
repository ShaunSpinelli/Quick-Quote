require 'terminal-table'

distance_cost = 400
location = "perth"
jobs = [
    {name:"Small shed", materials_cost: 100, time: 45}, # read and create array of jobs from txt using marshall
    {name:"Big shed", materials_cost: 100, time: 45}
]

contact = ["+61436481999", "quickquoteruby@gmail.com"]


table = Terminal::Table.new do |t|
t << ["Quick Quote", ""]
t << :separator
t.add_row ["Job:", "#{jobs[0][:name]}"]
t.add_row ["Materials: $#{jobs[0][:materials_cost].to_i}"]
# t.add_separator
# t.add_row ["Labour:", "Hours: #{@jobs[0][:time].to_i}\nRate: $50/hour"]
# t.add_separator
# t.add_row ["Total Labour:", "$#{@jobs[0][:time] * 50}"]
# t.add_row ["Travel to #{location}:", "$#{@distance_cost}"]
# t.add_row ["Total:", "$#{@distance_cost + @jobs[0][:materials_cost].to_i + (@jobs[0][:time] * 50)}"]

end

# table = Terminal::Table.new do |t|
#   t << ['One', 1]
#   t << :separator
#   t.add_row ["Two\nDouble", 2]
#   t.add_separator
#   t.add_row ['Three', 3]
# end


puts table
