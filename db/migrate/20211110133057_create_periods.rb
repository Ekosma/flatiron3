class CreatePeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :periods do |t|
      t.string :period_name
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
