namespace :data do
  desc "DUMP campaign data"
  task :dump => [:environment] do
    Campaign.dump_all_campaigns
    CampaignQuota.dump_campaign_quotas
  end
end