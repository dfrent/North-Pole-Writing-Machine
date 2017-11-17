require 'erb'

kids_data = File.read('../../data/kids-data.txt')
naughty_letter = File.read('naughty_letter_template.txt.erb')

kids_data.each_line do |kids|

  kid_data_array = kids.split

  name = kid_data_array[0]
  behaviour = kid_data_array[1]
  toy = kid_data_array[2..7]


  if behavior == 'naughty'
  end


  filename    = 'letters/naughty/' + name + '.txt'
  File.write(filename, letter_text)
end
