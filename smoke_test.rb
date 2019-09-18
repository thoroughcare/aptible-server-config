msg = 'smoke_test run from code within aptible-server-config repo'
msg += "\nReading env from server: #{ENV['SERVER_NAME']}"
if (defind?(SlackNotifier) rescue nil)
  SlackNotifier.new(text: msg, channel: 'server_status').notify
else
  puts msg
end

