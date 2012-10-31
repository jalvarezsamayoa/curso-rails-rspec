# autenticacion.rb

def crear_usuario(role)
  @usuario = Usuario.create(:email => "usuario@empresa.com", :password => "123456")
  @usuario.add_role role
end

def hacer_login
  visit new_usuario_session_path
  fill_in "Email", :with => "usuario@empresa.com"
  fill_in "Password", :with => "123456"
  click_button "Ingresar"
end

def hacer_login_como(role)
  crear_usuario(role)
  hacer_login
end