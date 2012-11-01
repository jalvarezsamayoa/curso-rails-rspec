#admnistracion_de_rutas_spec.rb
require 'spec_helper'

def ir_a_pagina_de_rutas
  hacer_login_como(:administrador)
  visit rutas_path
end

describe "Administracion de rutas:", :focus => true do
  context "como usuario no autenticado" do
    it "no puedo entrar" do
      visit rutas_path
      current_path.should == new_usuario_session_path
    end
  end

  context "como usuario vendedor" do
    it "no puedo entrar" do
      hacer_login_como(:vendedor)
      visit rutas_path
      page.should have_content("Toma de Encuestas")
    end
  end

  context "como usuario administrador" do

    it "puedo entrar a la pagina" do
      ir_a_pagina_de_rutas
      current_path.should == rutas_path
    end

    it "puedo crear una nueva ruta" do
      ir_a_pagina_de_rutas
      click_link('Nueva Ruta')
      current_path.should == new_ruta_path

      fill_in 'Nombre de Ruta', :with => "ruta No. 1"

      select('2012', :from => 'ruta_fecha_inicio_1i')
      select('octubre', :from => 'ruta_fecha_inicio_2i')
      select('30', :from => 'ruta_fecha_inicio_3i')

      select('2012', :from => 'ruta_fecha_final_1i')
      select('octubre', :from => 'ruta_fecha_final_2i')
      select('30', :from => 'ruta_fecha_final_3i')

      click_button 'Crear Ruta'

      page.should have_content('Cambios grabados con exito.')

      visit rutas_path
      page.should have_content('ruta No. 1')
    end

    it "no puedo grabar una ruta invalida" do
      ir_a_pagina_de_rutas
      click_link('Nueva Ruta')
      current_path.should == new_ruta_path
      fill_in 'Nombre de Ruta', :with => ''
      click_button 'Crear Ruta'
      page.should have_content('no puede estar en blanco')
    end

    it "puedo ver un listado de las rutas existentes" do
      Ruta.create(:nombre => "ruta No. 1",
                  :fecha_inicio => Date.today,
                  :fecha_final => Date.today + 6.weeks)

      ir_a_pagina_de_rutas

      page.should have_content('ruta No. 1')
      page.should have_content(Date.today)
      page.should have_content(Date.today + 6.weeks)
    end

    it "puedo editar una ruta existente" do
      @ruta =  Ruta.create(:nombre => "ruta No. 1",
                           :fecha_inicio => Date.today,
                           :fecha_final => Date.today + 6.weeks)

      ir_a_pagina_de_rutas

      click_link('Editar')
      current_path.should == edit_ruta_path(@ruta)

      fill_in 'Nombre de Ruta', :with => "ruta No. 2"

      select('2012', :from => 'ruta_fecha_inicio_1i')
      select('octubre', :from => 'ruta_fecha_inicio_2i')
      select('30', :from => 'ruta_fecha_inicio_3i')

      select('2012', :from => 'ruta_fecha_final_1i')
      select('octubre', :from => 'ruta_fecha_final_2i')
      select('30', :from => 'ruta_fecha_final_3i')

      click_button 'Actualizar Ruta'

      page.should have_content('Cambios grabados con exito.')

      visit rutas_path
      page.should have_content('ruta No. 2')
    end

    it "puedo eliminar una ruta existente" do
      @ruta =  Ruta.create(:nombre => "ruta No. 1",
                           :fecha_inicio => Date.today,
                           :fecha_final => Date.today + 6.weeks)

      ir_a_pagina_de_rutas

      click_link('Eliminar')

      page.should have_content('Ruta eliminada con exito.')
      page.should_not have_content('ruta No. 1')

    end


  end
end
