class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :author
      t.string :camera
      t.string :tags
      t.string :cropped_picture
      t.string :full_picture
      t.string :api_id

      t.timestamps
    end
  end
end
