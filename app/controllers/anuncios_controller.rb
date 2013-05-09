# encoding: utf-8
class AnunciosController < ApplicationController
	before_filter :authenticate_user!
	before_filter :restrito_por_anunciante, except: :create

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

	def approve
		anuncio = Anuncio.find params[:id]
		authorize! :approve, anuncio

		if anuncio.update_attribute :aprovado, true
			flash[:notice] = "O anúncio foi aprovado."
		end

		redirect_to root_path
	end

private
	def restrito_por_anunciante
		anuncio = Anuncio.find(params[:id])
		is_admin = current_user.role == "admin"

		unless is_admin || anuncio.pertence_ao_anunciante?(current_user)
			flash[:alert] = "Este anúncio não é seu espertinho"
			redirect_to root_path
		end
	end
end
