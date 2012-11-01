#admnistracion_de_encuestas_spec.rb
require 'spec_helper'

def ir_a_pagina_de_encuestas
   hacer_login_como(:administrador)
      visit encuestas_path
end

describe "Administracion de Encuestas:" do
  context "como usuario no autenticado" do
    it "no puedo entrar" do
     visit encuestas_path
     current_path.should == new_usuario_session_path
    end
  end

  context "como usuario vendedor" do
    it "no puedo entrar" do
      hacer_login_como(:vendedor)
      visit encuestas_path
      page.should have_content("Toma de Encuestas")
    end
  end

  context "como usuario administrador" do

    it "puedo entrar a la pagina" do
      ir_a_pagina_de_encuestas
      current_path.should == encuestas_path
    end

    it "puedo crear una nueva encuesta" do
      ir_a_pagina_de_encuestas
      click_link('Nueva Encuesta')
      current_path.should == new_encuesta_path

      fill_in 'Nombre de Encuesta', :with => "Encuesta No. 1"

      select('2012', :from => 'encuesta_fecha_inicio_1i')
      select('octubre', :from => 'encuesta_fecha_inicio_2i')
      select('30', :from => 'encuesta_fecha_inicio_3i')

      select('2012', :from => 'encuesta_fecha_fin_1i')
      select('octubre', :from => 'encuesta_fecha_fin_2i')
      select('30', :from => 'encuesta_fecha_fin_3i')

      click_button 'Crear Encuesta'

      page.should have_content('Cambios grabados con exito.')

      visit encuestas_path
      page.should have_content('Encuesta No. 1')
    end

    it "no puedo grabar una encuesta invalida" do
      ir_a_pagina_de_encuestas
      click_link('Nueva Encuesta')
      current_path.should == new_encuesta_path
      fill_in 'Nombre de Encuesta', :with => ''
      click_button 'Crear Encuesta'
      page.should have_content('error')
    end

    it "puedo ver un listado de las encuestas existentes" do
      Encuesta.create(:nombre => "Encuesta No. 1",
        :fecha_inicio => Date.today,
        :fecha_fin => Date.today + 6.weeks)

      ir_a_pagina_de_encuestas

      page.should have_content('Encuesta No. 1')
      page.should have_content(Date.today)
      page.should have_content(Date.today + 6.weeks)
    end

    it "puedo editar una encuesta existente" do
      @encuesta =  Encuesta.create(:nombre => "Encuesta No. 1",
        :fecha_inicio => Date.today,
        :fecha_fin => Date.today + 6.weeks)

      ir_a_pagina_de_encuestas

      click_link('Editar')
      current_path.should == edit_encuesta_path(@encuesta)

      fill_in 'Nombre de Encuesta', :with => "Encuesta No. 2"

      select('2012', :from => 'encuesta_fecha_inicio_1i')
      select('octubre', :from => 'encuesta_fecha_inicio_2i')
      select('30', :from => 'encuesta_fecha_inicio_3i')

      select('2012', :from => 'encuesta_fecha_fin_1i')
      select('octubre', :from => 'encuesta_fecha_fin_2i')
      select('30', :from => 'encuesta_fecha_fin_3i')

      click_button 'Actualizar Encuesta'

      page.should have_content('Cambios grabados con exito.')

      visit encuestas_path
      page.should have_content('Encuesta No. 2')
    end

    it "puedo eliminar una encuesta existente" do
      @encuesta =  Encuesta.create(:nombre => "Encuesta No. 1",
        :fecha_inicio => Date.today,
        :fecha_fin => Date.today + 6.weeks)

      ir_a_pagina_de_encuestas

      click_link('Eliminar')

      page.should have_content('Encuesta eliminada con exito.')
      page.should_not have_content('Encuesta No. 1')

    end


  end
end