class DashboardController < ApplicationController
  before_filter :authenticate_usuario!

  def show
  end
end
