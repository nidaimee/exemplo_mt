class HomeController < ApplicationController

  def index
    unless current_tenant
      redirect_to "http://localhost.com.br:3000/cadastre-se"
    else
      render(json: {
        email: current_tenant.try(:email) || "Nenhum Tenant",
        subdomain: current_tenant.try(:subdomain),
        portfolios: Portfolio.with_tenant(current_tenant)
      })
    end
  end

  def new_tenant
    render(plain: "Essa imobiliaria nao existe. =/ Cadastre a sua!")
  end

  private

end
