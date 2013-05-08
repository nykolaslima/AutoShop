# encoding: utf-8
class AnunciosController < ApplicationController
	def create
		anuncio = Anuncio.new params[:anuncio]

		if anuncio.save
			flash[:notice] = "Seu anúncio foi cadastrado."
		end

		redirect_to root_url
	end

	def edit
		@anuncio = Anuncio.find params[:id]
	end

	def update
		anuncio = Anuncio.find params[:id]
		if anuncio.update_attributes params[:anuncio]
			flash[:notice] = "Anúncio atualizado."
		end

		redirect_to root_url
	end
end
