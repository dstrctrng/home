require 'net/http'
require 'openssl'

URIS = [
  URI('https://rubygems.org'),
  URI('https://s3.amazonaws.com'),
  URI('https://d2chzxaqi4y7f8.cloudfront.net'),
  URI('https://rubygems.global.ssl.fastly.net'),
]

def connect_to uri, store
  http = Net::HTTP.new uri.hostname, uri.port

  http.use_ssl = uri.scheme.downcase == 'https'
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  http.cert_store = store

  http.get '/'

  true
rescue OpenSSL::SSL::SSLError
  false
end

def load_certificates io
  cert_texts =
    io.read.scan(/^-{5}BEGIN CERTIFICATE-{5}.*?^-{5}END CERTIFICATE-{5}/m)

  cert_texts.map do |cert_text|
    OpenSSL::X509::Certificate.new cert_text
  end
end

def show_certificates certificates
  certificates.each do |certificate|
    p certificate.subject.to_a
  end
end

def store_for certificates
  store = OpenSSL::X509::Store.new
  certificates.each do |certificate|
    store.add_cert certificate
  end

  store
end

def test_certificates certificates, uri
  1.upto certificates.length do |n|
    puts "combinations of #{n} certificates"
    certificates.combination(n).each do |combination|
      match = test_uri uri, combination

      if match then
        $needed_combinations << match
        puts
        return
      else
        print '.'
      end
    end
    puts
  end
end

def test_uri uri, certificates
  store = store_for certificates

  verified = connect_to uri, store

  return certificates if verified

  nil
end

def write_certificates certificates
  certificates.each do |certificate|
    subject = certificate.subject.to_a
    name = (subject.assoc('CN') || subject.assoc('OU'))[1]
    name = name.delete ' .-'

    open "lib/rubygems/ssl_certs/#{name}.pem", 'w' do |io|
      io.write certificate.to_pem
    end
  end
end

io =
  if ARGV.empty? then
    open OpenSSL::X509::DEFAULT_CERT_FILE
  else
    ARGF
  end

certificates = load_certificates io
puts "loaded #{certificates.length} certificates"

$needed_combinations = []

URIS.each do |uri|
  puts uri

  test_certificates certificates, uri
end

needed = $needed_combinations.flatten.uniq

write_certificates needed

