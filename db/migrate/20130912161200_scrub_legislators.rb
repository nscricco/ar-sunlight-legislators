require_relative '../config'

class ScrubLegislators < ActiveRecord::Migration
	def change
		# remove_column :legislators, :gender, :string
		remove_column :legislators, :congress_office, :string
		remove_column :legislators, :bioguide_id, :string
		remove_column :legislators, :votesmart_id, :string
		remove_column :legislators, :fec_id, :string
		remove_column :legislators, :govtrack_id, :string
		remove_column :legislators, :crp_id, :string
		remove_column :legislators, :congresspedia_url, :string
		remove_column :legislators, :youtube_url, :string
		remove_column :legislators, :facebook_id, :string
		remove_column :legislators, :official_rss, :string
		remove_column :legislators, :senate_class, :string
	end
end