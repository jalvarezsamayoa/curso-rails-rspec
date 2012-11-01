class Ruta < ActiveRecord::Base
  attr_accessible :fecha_final, :fecha_inicio, :nombre

  validates :nombre, :presence => true, :uniqueness => true
  validates :fecha_inicio, :fecha_final, :presence => true
end
