class LojaController < ApplicationController
  def principal
		@anuncios = Anuncio.all
  end
end
