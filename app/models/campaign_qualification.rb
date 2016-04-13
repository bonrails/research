class CampaignQualification < ActiveRecord::Base
  belongs_to :campaign_quota

  validates_presence_of :question_id, :pre_codes
end