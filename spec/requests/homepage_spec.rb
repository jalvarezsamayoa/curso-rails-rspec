# homepage_spec.rb
require 'spec_helper'

describe "Homepage" do

  context "como usuario anonimo" do

    it "debe mostrar la pagina" do
      get root_path
      response.status.should == 200
    end

    it "debe mostrar un link de 'Ingresar'" do
      get root_path
      response.body.should include('Ingresar')
    end

  end

end
