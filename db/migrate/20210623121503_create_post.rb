class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image_url
      t.string :description
      t.string :content

      t.timestamps
    end
  end
end
