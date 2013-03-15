class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :tag
      t.timestamps
    end
  end
end

# CREATE TABLE "posts" ("id" serial primary key, "title" character varying(255), "body" text, "tag_id" integer, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL)
