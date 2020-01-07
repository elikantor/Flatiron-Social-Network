class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :mood
      t.string :food
      t.string :music
      t.string :hobby
      t.string :job

      t.timestamps
    end
  end
end
