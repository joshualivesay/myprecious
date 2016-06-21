class AddDefaultToScheduler < ActiveRecord::Migration[5.0]
  def change
    change_column :schedulers, :active, :boolean, :default => true
  end
end
