class RemoveActiveFromSchedulers < ActiveRecord::Migration[5.0]
  def change
    remove_column :schedulers, :active
  end
end
