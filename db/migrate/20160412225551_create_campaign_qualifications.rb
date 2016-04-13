class CreateCampaignQualifications < ActiveRecord::Migration
  def change
    create_table :campaign_qualifications, force: :cascade do |t|
      t.integer :question_id
      t.text :pre_codes
      t.integer :campaign_quota_id
      t.timestamps null: false
    end

    add_index 'campaign_qualifications', ['campaign_quota_id']
    add_foreign_key 'campaign_qualifications', 'campaign_quotas'
  end
end
