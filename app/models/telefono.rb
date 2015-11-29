class Telefono < ActiveRecord::Base
	belongs_to :contatti
	validates :numero_di_telefono, presence: true
end
