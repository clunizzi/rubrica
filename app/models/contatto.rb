class Contatto < ActiveRecord::Base
	validates :nome, presence: true
	has_many :telefoni
	accepts_nested_attributes_for :telefoni, allow_destroy: true
	validates_associated :telefoni
	has_many :indirizzi
	validates_associated :indirizzi
	accepts_nested_attributes_for :indirizzi
	belongs_to :user
end
