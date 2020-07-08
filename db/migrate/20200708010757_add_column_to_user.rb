class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :spotify_data, :json, default: {}

  end
end
