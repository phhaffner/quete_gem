require 'rqrcode'

qrcode = RQRCode::QRCode.new("http://github.com/")
image = qrcode.as_png
svg = qrcode.as_svg
html = qrcode.as_html
string = qrcode.to_s


qr = RQRCode::QRCode.new( 'le ruby cest la vie', :size => 4, :level => :h )
qr.modules.each do |row|
    row.each do |col| 
        print col ? "X" : " "
    end
    print "\n"
end