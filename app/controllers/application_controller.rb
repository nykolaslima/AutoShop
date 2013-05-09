# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
	rescue_from CanCan::AccessDenied, with: :sem_autorizacao

private
	def sem_autorizacao
		redirect_to root_url, alert: "Você não tem autorização para acessar esse recurso"
	end
end
