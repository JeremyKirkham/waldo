class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :direction, null: false
      t.jsonb :response, null: false, default: '{}'

      t.timestamps
    end
    add_index :messages, :direction
    add_index :messages, :response, using: :gin
  end
end
