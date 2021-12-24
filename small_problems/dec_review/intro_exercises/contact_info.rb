contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }
i = 0
contacts.each do |k, v|
  contacts[k][:email] = contact_data[i][0]
  contacts[k][:address] = contact_data[i][1]
  contacts[k][:phone] = contact_data[i][2]
  i += 1
end

p contacts

p contacts['Joe Smith'][:email]
p contacts['Sally Johnson'][:phone]