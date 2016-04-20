class CampaignsController < ApplicationController

  def ordered_campaigns
    @list=Campaign.includes(campaign_quotas: [:campaign_qualifications]).where('campaign_qualifications.question_id IN (?)', [42,43]).references(campaign_quotas: :campaign_qualifications).order(:length_of_interview, cpi: :desc)
    render :index
  end
end
