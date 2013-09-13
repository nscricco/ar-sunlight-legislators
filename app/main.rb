require_relative './models/legislator.rb'

module Tasks

	def self.print_by_state arg_state
		legislators_from_state = Legislator.get_legislators_by_state(arg_state)
		puts "Senators:"
		legislators_from_state[:senators].each do |senator|
			puts "\t#{senator.name} (#{senator.party})"
		end
		puts "Representatives:"
		legislators_from_state[:representatives].each do |representative|
			puts "\t#{representative.name} (#{representative.party})"
		end
	end

	def self.print_gender shorthand
		return 'Male' if shorthand.upcase == 'M'
		return 'Femaile' if shorthand.upcase == 'F'
	end

	def self.print_gender_stats arg_gender
		legislators_from_state = Legislator.get_legislators_by_gender(arg_gender)
		legislators_count = Legislator.get_total_number_of_legislators
		senators_count = legislators_from_state[:senators].length
		representatives_count = legislators_from_state[:representatives].length
		puts "#{print_gender(arg_gender)} Senators: #{senators_count} (#{(senators_count/(legislators_count[:senators].to_f)).round(4)*100}%)" 
		puts "#{print_gender(arg_gender)} Representatives: #{representatives_count} (#{(representatives_count/(legislators_count[:representatives].to_f)).round(4)*100}%)" 
	end

	def self.print_number_of_legislators
		legislators_count = Legislator.get_total_number_of_legislators
		puts "Senators: #{legislators_count[:senators]}"
		puts "Representatives: #{legislators_count[:representatives]}"
	end

	def self.print_number_of_legislators_by_state
		sorted_hash = sort_hash_by_states(Legislator.get_legislator_count_by_state)
		sorted_hash.each do |key, value|
			puts "#{key.to_s}: #{value[:Sen]} Senators, #{value[:Rep]} Representative(s)" unless value.length < 2
		end
	end

	def self.sort_hash_by_states arg_hash
		arg_hash.flatten.map {|i| i.to_s}
		arg_hash.sort
	end
end

# Tasks.print_by_state('MA')

# Tasks.print_gender_stats('M')
# puts
# Tasks.print_gender_stats('F')

# Tasks.print_number_of_legislators

Tasks.print_number_of_legislators_by_state