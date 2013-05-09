class LojaController < ApplicationController
  def principal
		@anuncios = Anuncio.includes(:anunciante).all
  end
end
