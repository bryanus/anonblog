class CreateTablePostsTags < ActiveRecord::Migration
  def change
    create_table :poststags do |t|
      t.references :post
      t.references :tag
    end
  end
end

# CREATE TABLE "poststags" ("id" serial primary key, "post_id" integer, "tag_id" integer)
