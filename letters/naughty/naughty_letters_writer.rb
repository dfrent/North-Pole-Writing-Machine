require 'erb'

kids_data = File.read('../../data/kids-data.txt')
naughty_letter = File.read('naughty_letter_template.txt.erb')

kids_data.each_line do |kids| #iterate throught the kids database


  kids_data = kids.split

                #takes out the white spaces/new lines
  infractions_arry = kids.split("|")
  infractions_string = infractions_arry[1].to_s
  infraction = infractions_string.strip.gsub("\n", "")

  new_toy = kids_data[rand(4) + 2] #choses new kids toy at randon from array

  name = kids_data[0]
  behavior = kids_data[1]
  toy = kids_data[2..7]



  next unless behavior == 'naughty' #chooses naughty behavior if true



  filename = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)


  puts "Writing #{filename}."
  File.write(filename, letter_text)
end

puts "All done!"
