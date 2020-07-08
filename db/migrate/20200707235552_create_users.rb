class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :email
      t.string :uri 
      t.string :token
    end
  end
end
