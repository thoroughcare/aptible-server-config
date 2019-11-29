class SlackNotifier
  require 'net/http'
  require 'uri'
  require 'openssl'
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def notify
    return if ENV['SLACK_WEBHOOK'].nil?
    channel = '#' + (params[:channel] || 'dev')
    uri = URI.parse ENV['SLACK_WEBHOOK']
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)
    request.body = "payload={'channel': '#{channel}', 'username': 'webhookbot', 'text': '#{params[:text]}'}"
    http.request(request)
  end
end
