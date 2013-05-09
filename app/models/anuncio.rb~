class Anuncio < ActiveRecord::Base
  attr_accessible :ano, :descricao, :modelo, :valor

	belongs_to :anunciante, class_name: "User"

	def pertence_ao_anunciante?(anunciante)
		self.anunciante == anunciante
	end
end
