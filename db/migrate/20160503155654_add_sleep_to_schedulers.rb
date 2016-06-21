class AddSleepToSchedulers < ActiveRecord::Migration[5.0]
  def change
    add_column :schedulers, :sleep, :integer, :default => 0
  end
end
