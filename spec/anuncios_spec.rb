# encoding: utf-8
require "spec_helper"
require "capybara/rails"
require "capybara/rspec"

describe "Cadastro de anúncios" do
	context "Preenchendo formulário corretamente" do
		it "deveria criar e exibir o novo anúncio" do
			autentica
			visit "/"

			fill_in "Modelo", with: "Fusca"
			fill_in "Marca", with: "Volks"
			fill_in "Descricao", with: "Carrinho maroto"
			fill_in "Ano", with: "1972"
			fill_in "Valor", with: "6500"
			click_button "Create Anuncio"

			expect(page).to have_content "Fusca"
			expect(page).to have_content "Volks"
			expect(page).to have_content "Carrinho maroto"
			expect(page).to have_content "1972"
			expect(page).to have_content "6500"
		end
	end
end
