#www.captcha.net
require 'digest/md5'

class Captcha
  attr_accessor :user, :secret, :alphabet

  def initialize
    self.user= 'jmoore'
    self.secret= 'XxyNo3kvvwehjZIT3PCqWqxKEIhPC6TfvXxg4bJt'
    #self.random= 'my_random_text'
    self.alphabet='abcdefghijklmnopqrstuvwxyz'
  end

  def decrypt(random)
    bytes = Digest::MD5.hexdigest(secret + random).slice(0..(2*6 - 1)).scan(/../)
    text = ''
puts random
    bytes.each do |byte|
      text << alphabet[byte.hex % alphabet.size].chr
    end
    return text
  end

  def self.random
    rand.to_s
  end
end
