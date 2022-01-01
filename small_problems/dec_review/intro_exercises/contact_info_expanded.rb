contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

keys = [:email, :address, :phone]

contacts.each do |contact, _|
  info_set = contact_data.shift

  keys.each do |key|
    contacts[contact][key] = info_set.shift
  end
end

p contacts