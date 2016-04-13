module BaseService
  VERSION = 'v1'
  BASE_URL = "http://staging.tapresearch.com"

  def token_auth
    Base64::encode64("codetest@tapresearch.com:76b2ef0268a9177927a95bd4db4b8dbc").gsub(/\n/, '')
  end

  def connection
    @conn ||= Faraday.new(url: BASE_URL) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.headers['Authorization'] =  "Basic #{token_auth}"
    end
  end
end