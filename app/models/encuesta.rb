class Encuesta < ActiveRecord::Base
  attr_accessible :fecha_fin, :fecha_inicio, :nombre

  validates :nombre, :presence => true, :uniqueness => true

  has_many :preguntas
end
