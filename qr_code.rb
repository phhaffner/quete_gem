require 'chunky_png'
require 'rqrcode'

qrcode = RQRCode::QRCode.new("http://github.com/")
image = qrcode.as_png	
# string = qrcode.to_s

image = qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 120,
          border_modules: 4,
          module_px_size: 6,
          )

# image = ChunkyPNG::Image.new(16, 16, ChunkyPNG::Color::TRANSPARENT)
# image[1,1] = ChunkyPNG::Color.rgba(10, 20, 30, 128)
# png[2,1] = ChunkyPNG::Color('black @ 0.5')
image.save('img/qr_code.png', :interlace => true)

qr_string = ''
print "Choisissez une phrase à transformer en QR code? "
qr_string = gets
puts "#{qr_string}"



qr = RQRCode::QRCode.new( "#{qr_string}", :size => 4, :level => :h )
qr.modules.each do |row|
    row.each do |col| 
        print col ? "X" : " "
    end
    print "\n"
end

