class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns, force: :cascade do |t|
      t.integer :length_of_interview
      t.string :cpi
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
