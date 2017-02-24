class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.belongs_to :atricle
      t.string :title
      t.string :body
      t.datetime :version
      t.timestamps
    end
  end
end
