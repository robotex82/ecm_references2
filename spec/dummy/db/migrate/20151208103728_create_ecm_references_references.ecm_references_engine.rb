# This migration comes from ecm_references_engine (originally 2)
class CreateEcmReferencesReferences < ActiveRecord::Migration
  def change
    create_table :ecm_references_references do |t|
      t.string :name
      t.text :description

      # acts as list
      t.integer :position

      # acts as markup
      t.string :markup_language

      # acts as published
      t.timestamp :published_at

      # friendly id
      t.string :slug

      # references
      t.references :ecm_references_category

      t.timestamps
    end
  end
end
