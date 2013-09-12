require_relative '../app/models/politician'
require_relative '../app/models/seat'

class SunlightLegislatorsImporter
  def self.import(filename)
    field_names = nil
    File.open(filename).each do |line|

      data = line.chomp.split(',')

      if field_names.nil?
        field_names = data

      else
        seat_attribute_hash = {}
        politician_attribute_hash = {}
        all_attribute_hash = Hash[field_names.zip(data)]

        all_attribute_hash.each do |key, value|
          if [:title, :state, :district].include?(key)
            seat_attribute_hash[key] = value
          elsif [:firstname, :middlename, :lastname, :name_suffix, :nickname, :party, :in_office, :gender, :phone, :fax, :website, :webform, :twitter_id, :birthdate].include?(key)
            politician_attribute_hash[key] = value
          end
        end
        # raise NotImplementedError, "TODO: figure out what to do with this row and do it!"
      end
      politician = Politician.create!(politician_attribute_hash)
      seat = Seat.create!(seat_attribute_hash)
    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
