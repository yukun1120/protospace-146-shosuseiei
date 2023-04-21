class RemoveOccuPationFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :occu_pation, :text
  end
end
