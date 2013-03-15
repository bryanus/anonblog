class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |t|
      t.integer :post_id
      t.integer :tag_id
      t.timestamps
    end
  end
end



# CREATE TABLE "posts_tags" ("id" serial primary key, "post_id" integer, "tag_id" integer, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL)
