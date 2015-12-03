class Telefono < ActiveRecord::Base
	belongs_to :contatti
	VALIDAZIONE_TELEFONO_REGEXP = /\A\+?[0-9][^a-z]+\z/i
	validates :numero_di_telefono, presence: true,
	                               length: { minimum: 9, maximum: 17},
	                               format: { with: VALIDAZIONE_TELEFONO_REGEXP }
end
