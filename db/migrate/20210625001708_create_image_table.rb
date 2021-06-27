class CreateImageTable < ActiveRecord::Migration[6.1]
  def change
    create_table :image_tables do |t|
      t.string :url
      t.timestamps
    end
  end
end
