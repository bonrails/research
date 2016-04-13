class CreateCampaignQuotas < ActiveRecord::Migration
  def change
    create_table :campaign_quotas, force: :cascade do |t|
      t.integer  :campaign_id
      t.timestamps null: false
    end
    add_index 'campaign_quotas', ['campaign_id']
    add_foreign_key 'campaign_quotas', 'campaigns'
  end
end
