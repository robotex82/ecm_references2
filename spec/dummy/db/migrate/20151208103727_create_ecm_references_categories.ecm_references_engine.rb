# This migration comes from ecm_references_engine (originally 1)
class CreateEcmReferencesCategories < ActiveRecord::Migration
  def change
    create_table :ecm_references_categories do |t|
      t.string :name
      t.text :description
      t.string :locale

      # acts as markup
      t.string :markup_language

      # awesome nested set
      t.integer :lft
      t.integer :rgt
      t.references :parent
      t.integer :depth

      # friendly id
      t.string :slug

      t.timestamps
    end
    add_index :ecm_references_categories, :parent_id
  end
end
