require 'chunky_png'
require 'rqrcode'

qrcode = RQRCode::QRCode.new("http://github.com/")

image = qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 120,
          border_modules: 4,
          module_px_size: 6,
          )

qr_string = ''
img_string = ''
print "Choisissez une phrase à transformer en QR code? "
qr_string = gets
puts "#{qr_string}"
print "Choisissez un nom à donner à l'image de ce QR code? "
img_string = gets
puts "#{img_string}"

qr = RQRCode::QRCode.new( "#{qr_string}", :size => 4, :level => :h )
qr.modules.each do |row|
    row.each do |col| 
        print col ? "X" : " "
    end
    print "\n"
end

image.save( "qr_img/#{img_string}.png", :interlace => true)