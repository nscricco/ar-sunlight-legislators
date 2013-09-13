require_relative '../../db/config'

class Legislator < ActiveRecord::Base

	def self.get_legislators_by_state arg_state
		legislators = {}
		legislators[:representatives] = Legislator.where(title: 'Rep', state: arg_state)
		legislators[:senators] = Legislator.where(title: 'Sen', state: arg_state)
		return legislators
	end

	def self.get_legislators_by_gender arg_gender
		legislators = {}
		legislators[:representatives] = Legislator.where(title: 'Rep', gender: arg_gender)
		legislators[:senators] = Legislator.where(title: 'Sen', gender: arg_gender)
		return legislators
	end

	def self.get_total_number_of_legislators
		legislators = {}
		legislators[:representatives] = Legislator.where(title: 'Rep').length
		legislators[:senators] = Legislator.where(title: 'Sen').length
		return legislators
	end

	def self.conditional_add_one hash, key
		hash[key] == nil ? hash[key] = 1 : hash[key] += 1
	end

	def self.get_legislator_count_by_state
		all_states = {}
		Legislator.find_each do |legislator|
			# conditional_add_one(all_states_legislators, (("#{legislator.state} #{legislator.title}").to_sym))
			state = legislator.state.to_sym
			all_states[state] == nil ? legislators = {} : legislators = all_states[state]
				
			conditional_add_one(legislators, legislator.title.to_sym)
			all_states[state] = legislators
		end
		return all_states
	end

	def name
		"#{firstname}#{((" \'" + nickname + "\'") unless nickname == '')}#{((" " + middlename) unless middlename == '')} #{lastname}#{" " + name_suffix if name_suffix != nil}"
	end
end