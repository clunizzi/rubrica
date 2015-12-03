class Contatto < ActiveRecord::Base
	has_many :telefoni, dependent: :destroy
	has_many :indirizzi, dependent: :destroy
	belongs_to :user
	scope :order_by_nome, -> { order('LOWER(nome)') }
	mount_uploader :foto, FotoUploader
	validates :nome, presence: true
	validates_associated :telefoni
	validates_associated :indirizzi
	validate :dimensione_max_immagine
	accepts_nested_attributes_for :indirizzi, 
								allow_destroy: true,
								reject_if: proc { |attributes| attributes['indirizzo'].blank? &&
															   attributes['cap'].blank? &&
															   attributes['citta'].blank?  }
	accepts_nested_attributes_for :telefoni, reject_if: :all_blank, allow_destroy: true

	def self.cerca(contatto)
      # where(:title, query) -> This would return an exact match of the query
      where("nome like ?", "%#{contatto}%") 
    end

    def dimensione_max_immagine
    	if foto.size > 3.megabytes
    		errors.add(:foto, "dovrebbe essere più piccola di 3mb")
    	end
    end
end
