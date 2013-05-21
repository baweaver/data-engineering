class CreateTabfiles < ActiveRecord::Migration
  def change
    create_table :tabfiles do |t|
      t.string :file_name
      t.boolean :parsed

      t.timestamps
    end
  end
end
