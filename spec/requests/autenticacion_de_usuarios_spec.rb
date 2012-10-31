#autenticacion_de_usuarios_spec.rb
require 'spec_helper'

describe "Autenticacion de Usuarios:" do

  context "como usuario administrador" do

    context "no autenticado" do
      it "debe mostrar el formulario de inicio" do
        visit new_usuario_session_path
        page.should have_content("Ingrese Credenciales")
      end

      it "debe ir al Dashboard despues de autenticarse" do
        crear_usuario(:administrador)
        hacer_login
        page.should have_content("Panel de Control")
      end
    end
  end

  context "como usuario vendedor" do
    context "no autenticado" do
      it "debe mostrar el formulario de inicio" do
        visit new_usuario_session_path
        page.should have_content("Ingrese Credenciales")
      end

      it "debe ir a la Toma de Encuestas despues de autenticarse" do
        crear_usuario(:vendedor)
        hacer_login
        page.should have_content("Toma de Encuestas")
      end
    end
  end

  context "como usuario previamente autenticado" do
    it "debo ver un link de Salir" do
      crear_usuario(:foo)
      hacer_login
      page.should have_content("Salir")
    end

    it "al hacer click en Salir debe cerrar sesion" do
      crear_usuario(:foo)
      hacer_login
      click_link "Salir"
      page.should have_content("Sesion finalizada.")
    end
  end

end
