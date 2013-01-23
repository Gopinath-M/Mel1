require 'drb'
DRb.start_service
obj = DRbObject.new(nil, 'druby://localhost:2901')
puts "Admin Email client has started..."
# Now use obj
while(true) do
	begin
    obj.send_newsletter
    sleep(900)
  rescue Exception =>e
    p "========exception #{e.to_s}"
  end
end