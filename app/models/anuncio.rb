class Anuncio < ActiveRecord::Base
  attr_accessible :ano, :descricao, :modelo, :valor, :marca_attributes, :marca_id

	belongs_to :anunciante, class_name: "User"
	belongs_to :marca

	accepts_nested_attributes_for :marca

	def pertence_ao_anunciante?(anunciante)
		self.anunciante == anunciante
	end

	def self.aprovados
		where aprovado: true
	end
end
