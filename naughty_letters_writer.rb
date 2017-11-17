require 'erb'
require 'pry'
kids_data = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.txt.erb')
#
kids_data.each_line do |kid| #iterate throught the kids database
#
#
  kids_data_array = kid.split
#
                #takes out the white spaces/new lines
  infractions_arry = kid.split("|")
  infractions_string = infractions_arry[1].to_s
  infraction = infractions_string.strip.gsub("\n", "")
#
  new_toy = kids_data_array[2..7].shuffle #choses new kids toy at randon from array
#
  name = kids_data_array[0]
  behavior = kids_data_array[1]
  toy = kids_data_array[2..7]
#
  next unless behavior == 'naughty' #chooses naughty behavior if true
#
#
  filename = 'letters/naughty/' + name + '.txt'
  # binding.pry
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)


  puts "Writing #{filename}."
  File.write(filename, letter_text)
end
#
puts "All done!"
