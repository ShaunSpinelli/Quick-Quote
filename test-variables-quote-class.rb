distance_cost = 400
location = "perth"
jobs = [
    {name:"Small shed", materials_cost: 100, time: 45}, # read and create array of jobs from txt using marshall
    {name:"Big shed", materials_cost: 100, time: 45}
]

contact = ["+61436481999", "quickquoteruby@gmail.com"]

quote = Quote.new(jobs, distance_cost, location, contact)
quote.put_quote
quote.text_quote
quote.write_quote
quote.email_quote
