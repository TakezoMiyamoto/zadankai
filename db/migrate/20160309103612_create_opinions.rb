class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :conference, index: true, foreign_key: true
      t.string :opinion_user
      t.text :body

      t.timestamps null: false
      t.index [:user_id, :created_at]
      t.index [:conference_id, :created_at]
    end
  end
end
