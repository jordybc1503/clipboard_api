class CreateClipboards < ActiveRecord::Migration[8.0]
  def change
    create_table :clipboards do |t|
      t.text :content

      t.timestamps
    end
  end
end
