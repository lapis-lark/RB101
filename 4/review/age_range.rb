# iterate over each member
# add age group based on age

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

munsters.each do |_member, info|
  title = case info['age']
          when 0..17 then 'kid'
          when 18..64 then 'adult'
          when 65.. then 'senior'
          end
  info['age_group'] = title
end

p munsters
