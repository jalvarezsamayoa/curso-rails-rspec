class HomepageController < ApplicationController
  #before_filter :authenticate_usuario!

  def index
    #puts "index"
    if usuario_signed_in?
      #puts "signed in"
      redirect_to '/admin/dashboard'
    end
  end
end
