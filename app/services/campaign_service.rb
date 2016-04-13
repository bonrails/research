require_relative 'base_service'
module CampaignService
  extend BaseService

  def self.all
    response =connection.get("/api/#{BaseService::VERSION}/campaigns")
    JSON.parse(response.body)
  end

  def self.find_by_id(id)
    response =connection.get("/api/#{BaseService::VERSION}/campaigns/#{id}")
    JSON.parse(response.body)
  end
end