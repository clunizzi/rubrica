class Contatto < ActiveRecord::Base
	belongs_to :user
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
	default_scope -> { order(nome: :asc) }

	def self.cerca(contatto)
    # where(:title, query) -> This would return an exact match of the query
    where("nome like ?", "%#{contatto}%") 
  end
end
