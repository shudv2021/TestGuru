class GitHubClient
  ROOT_ENDPOINT = 'https:/api.github.com'
  ACCESS_TOKEN = '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'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    #params подготаливаются и передаются другим блоком в готовом виде
    @http_client.post('gists') do |request|
      request.headers['Authorisation'] = "token #{ACCESS_TOKEN}"
      request.headers['Content_Type'] = 'aplication/json'
      request.body = params.to_json
    end
  end

  private
  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
    #create new connection with gem Faraday
  end
end
