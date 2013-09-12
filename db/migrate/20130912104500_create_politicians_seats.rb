require_relative '../config'

class CreatePoliticiansSeats < ActiveRecord::Migration
	def change
		create_table :politicians do |t|
			t.string :firstname
			t.string :middlename
			t.string :lastname
			t.string :name_suffix
			t.string :nickname
			t.string :party
			t.integer :seat_id
			t.boolean :in_office
			t.string :gender
			t.string :phone
			t.string :fax
			t.string :website
			t.string :webform
			t.string :twitter_id
			t.date :birthdate
			t.timestamp
		end

		create_table :seats do |t|
			t.string :title
			t.string :state
			t.integer :district
			t.timestamp
		end
	end
end