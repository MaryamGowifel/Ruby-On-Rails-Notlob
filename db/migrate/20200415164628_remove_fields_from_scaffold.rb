class RemoveFieldsFromScaffold < ActiveRecord::Migration[6.0]
  def change

    remove_column :friendships, :destroy
    remove_column :friendships, :create
  end
end
