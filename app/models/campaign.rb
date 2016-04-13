class Campaign < ActiveRecord::Base
  has_many :campaign_quotas
  validates_presence_of :name, :length_of_interview, :cpi, :id

  def self.dump_all_campaigns
    CampaignService.all.each do |campaign|
      Campaign.find_or_create_by(
        id: campaign['id'],
        name: campaign['name'],
        cpi: campaign['cpi'],
        length_of_interview: campaign['length_of_interview']
      )
    end
  end
end