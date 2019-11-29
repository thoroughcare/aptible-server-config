class GrafanaNotifier
  require 'json'
  require 'net/http'
  require 'uri'
  require 'openssl'
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def notify
    return if ENV['GRAFANA_API_KEY'].nil?
    uri = URI.parse 'https://tcscale.grafana.net'
    http = Net::HTTP.new(uri.host, uri.port)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE unless defined?(Rails) && Rails.env.production?
    http.use_ssl = true
    request = Net::HTTP::Post.new('/api/annotations')
    request['Authorization'] = "Bearer #{ENV['GRAFANA_API_KEY']}"
    request['Content-Type'] = 'application/json'
    request['Accept'] = 'application/json'
    request.body = {
        dashboardId: 11,
        time: (Time.now.to_f * 1000).to_i,
        tags: ['Deploy'],
        text: 'Scale down'
    }.merge(@params).to_json
    http.request(request)
  end
end
