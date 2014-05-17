class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
       t.references :activity_object
       t.integer :user_id
      t.string :subject
      t.text :body
      t.string :article_type

      t.timestamps
    end
  end
end
