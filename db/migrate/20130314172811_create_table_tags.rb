class CreateTableTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
  end
end

# CREATE TABLE "tags" ("id" serial primary key, "name" character varying(255), "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL)
