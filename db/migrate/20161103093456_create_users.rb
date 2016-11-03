class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: "", limit: 120
      t.string :last_name, null: false, default: "", limit: 120
      t.string :email, default: ""
      t.string :mobile_number, null: false, default: "", limit: 13

      t.timestamps
    end
  end
end
