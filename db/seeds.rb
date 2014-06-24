names = File.new('db/names')

names.each do |name|
  Person.create(name: name.strip)
end