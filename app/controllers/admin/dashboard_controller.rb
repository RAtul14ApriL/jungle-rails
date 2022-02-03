class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: "Jungle", password: "book", only: [:show]

  def show
  end
end
