class CreateAtricles < ActiveRecord::Migration[5.0]
  def change
    create_table :atricles do |t|
      t.string :title
      t.string :body
      t.belongs_to :user
      t.timestamps
    end
  end
end
