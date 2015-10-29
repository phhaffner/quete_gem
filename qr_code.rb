require 'rqrcode_png'

print "Choisissez une phrase à transformer en QR code? "
	qr_string = gets.chomp
	puts "#{qr_string}"
print "Choisissez un nom à donner à l'image de ce QR code? "
	img_string = gets.chomp
	puts "#{img_string}"

qr = RQRCode::QRCode.new( "#{qr_string}", :size => 4, :level => :h )
	qr.modules.each do |row|
	    row.each do |col| 
	        print col ? "X" : " "
	    end
	    print "\n"
end

image = qr.to_img
image.resize(90, 90).save("qr_img/#{img_string}.png")