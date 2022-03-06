# iterate over each object
# add hash value with index as value, object as key

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

def index_as_value(arr)
  arr.each_with_index.with_object({}) do |(name, ind), hash|
    hash[name] = ind
  end
end

p index_as_value(flintstones)