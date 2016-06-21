class CreateSchedulers < ActiveRecord::Migration[5.0]
  def change
    create_table :schedulers do |t|
      t.string :location
      t.boolean :active

      t.timestamps
    end
  end
end
