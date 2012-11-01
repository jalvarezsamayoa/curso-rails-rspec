class CreateRutas < ActiveRecord::Migration
  def change
    create_table :rutas do |t|
      t.string :nombre
      t.date :fecha_inicio
      t.date :fecha_final

      t.timestamps
    end
  end
end
