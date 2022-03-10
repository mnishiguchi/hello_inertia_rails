class CreateChecklistItems < ActiveRecord::Migration[5.0]
  def change
    create_table :checklist_items do |t|
      t.string :name, null: false
      t.boolean :checked, null: false, default: false
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
