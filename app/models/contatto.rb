class Contatto < ActiveRecord::Base
	validates :nome, presence: true
	has_many :telefoni
	accepts_nested_attributes_for :telefoni, reject_if: :all_blank, allow_destroy: true
	validates_associated :telefoni
	has_many :indirizzi
	validates_associated :indirizzi
	accepts_nested_attributes_for :indirizzi, 
								allow_destroy: true,
								reject_if: proc { |attributes| attributes['indirizzo'].blank? &&
															   attributes['cap'].blank? &&
															   attributes['citta'].blank?  }
	belongs_to :user
end
