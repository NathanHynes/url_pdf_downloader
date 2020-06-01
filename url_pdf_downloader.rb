require 'open-uri'

input_array = ARGV

directory_name= input_array[0]
volume_name = input_array[1]
pages = input_array[2].to_i
volume_identifier = input_array[3]

(1..pages).each do |i|
  Dir.mkdir("./issues/#{directory_name}") unless Dir.exist?("./issues/#{directory_name}")

  Dir.mkdir("./issues/#{directory_name}/#{volume_name}") unless Dir.exist?("./issues/#{directory_name}/#{volume_name}")
  

  File.open("./issues/#{directory_name}/#{volume_name}/#{volume_name}_#{i}.pdf", "wb") do |file|
    file.write open("https://voices.revealdigital.org/cgi-bin/imageserver.pl?oid=#{volume_identifier}.1.#{i}&getpdf=true").read
  end
end
