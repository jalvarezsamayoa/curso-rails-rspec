class CreateEncuestas < ActiveRecord::Migration
  def change
    create_table :encuestas do |t|
      t.string :nombre
      t.date :fecha_inicio
      t.date :fecha_fin

      t.timestamps
    end
  end
end
