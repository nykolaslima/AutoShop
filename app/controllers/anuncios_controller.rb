# encoding: utf-8
class AnunciosController < ApplicationController
	before_filter :authenticate_user!

	def create
		anuncio = Anuncio.new params[:anuncio]
		anuncio.anunciante = current_user

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

	def delete
		@anuncio = Anuncio.find params[:id]
	end

	def destroy
		anuncio = Anuncio.find params[:id]
		
		if anuncio.destroy
			flash[:notice] = "O anúncio foi excluído."
		end

		redirect_to root_path
	end
end
