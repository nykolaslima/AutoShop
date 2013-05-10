class LojaController < ApplicationController
  def principal
		is_admin = current_user && current_user.role == "admin"
		
		if is_admin
			@anuncios = Anuncio.includes(:anunciante).all
		else
			@anuncios = Anuncio.includes(:anunciante).aprovados
		end

  end
end
