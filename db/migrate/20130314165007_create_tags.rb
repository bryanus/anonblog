class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :post
    end
  end
end

# CREATE TABLE "tags" ("id" serial primary key, "name" character varying(255), "post_id" integer)
