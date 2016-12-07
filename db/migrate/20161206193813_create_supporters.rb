class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      t.integer :user_id
      t.integer :supporter_id

      t.timestamps null: false
    end
  end
end
