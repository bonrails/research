class CampaignQuota < ActiveRecord::Base
  self.table_name = 'campaign_quotas'
  belongs_to :campaign
  has_many :campaign_qualifications

  def self.dump_campaign_quotas
    Campaign.all.each do |campaign|
      create_campaign_quota(campaign)
    end
  end

  def self.create_campaign_quota(campaign)
    json = CampaignService.find_by_id(campaign.id)
    json['campaign_quotas'].each do |quota|
      ActiveRecord::Base.transaction do # just in case if one of the validation fails
        CampaignQuota.find_or_create_by!(
          id: quota['id'],
          campaign_id: campaign.id
        )

        quota['campaign_qualifications'].each do |qualification|
          CampaignQualification.create!(
            pre_codes: qualification['pre_codes'].join(','),
            question_id: qualification['question_id'],
            campaign_quota_id: quota['id']
          )
        end
      end
    end
  end
end