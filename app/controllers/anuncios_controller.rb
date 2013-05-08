# encoding: utf-8
class AnunciosController < ApplicationController
	def create
		anuncio = Anuncio.new params[:anuncio]

		if anuncio.save
			flash[:notice] = "Seu anúncio foi cadastrado."
		end

		redirect_to root_url
	end
end
