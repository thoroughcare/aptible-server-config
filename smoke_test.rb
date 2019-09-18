msg = 'smoke_test run from code within aptible-server-config repo'
msg += "\nReading env from server: #{ENV['SERVER_NAME']}"
if (defind?(SlackNotifier) rescue nil)
  SlackNotifier.new(text: msg, channel: 'server_status').notify
else
code=<<-EOF
curl -X POST --data-urlencode 'payload={"channel": "#server_status", "username": "Cirlce-CI", "text": "#{msg}"}' #{ENV['SLACK_WEBHOOK']}
EOF
  code = code.split("\n").find{|line| line[/urlencode/]}
  system(code)
end

