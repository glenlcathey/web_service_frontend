class CreateKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :keys do |t|
      t.string :email
      t.string :sshkey

      t.timestamps
    end
    add_index :keys, :email, unique: true
  end
end
