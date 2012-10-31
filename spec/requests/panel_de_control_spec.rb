#panel_de_control_spec.rb
require 'spec_helper'

describe "Panel de Control:" do

  context "como usuario no autenticado" do
    it "no puedo ver el panel de control" do
      visit "/admin/dashboard"
      page.should have_content('Ingrese Credenciales')
    end
  end

  context "como usuario autenticado" do
    it "puedo ver el panel de control" do
      crear_usuario(:foo)
      hacer_login
      page.should have_content('Panel de Control')
    end

    context "tipo adminstrador" do
      context "puedo ver un link para" do
        before(:each) do
          crear_usuario(:administrador)
          hacer_login
        end

        it "administracion de Usuarios" do
          page.should have_link('Administrar Usuarios')
        end

        it "administracion de Encuestas" do
          page.should have_link('Administrar Encuestas')
        end

        it "administracion de roles" do
          page.should have_link('Administrar Roles')
        end

        it "administracion de rutas" do
          page.should have_link('Administrar Rutas')
        end

        it "asignar cliente a rutas" do
          page.should have_link('Asignar clientes a rutas')
        end

        it "asignacion de articulos" do
          page.should have_link('Asignacion de articulos')
        end

        it "asignacion de ruta a usuario" do
          page.should have_link('Asignacion de rutas a usuarios')
        end

      end
    end

    context "tipo vendor" do
      it "debo estar en el panel de control de vendedores" do
        pending
      end

      context "debo ver" do
        it "un link para toma de encuestas" do
          crear_usuario(:vendedor)
          hacer_login
          page.should have_link('Toma de Encuestas')
        end
      end
    end
  end
end
