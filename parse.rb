require 'nokogiri'
require 'net/https'
require 'open-uri'
require 'openssl'
require 'watir-webdriver'

USER = 'YOUR_COURSERA_EMAIL'
PWD = 'YOUR_COURSERA_PASSWORD'

BROWSER_SLEEP = 4

CLASS_PATH = 'proglang-2012-001'

SIGNIN_URL = 'https://www.coursera.org/account/signin'
FORUM_HOME_URL = "https://class.coursera.org/#{CLASS_PATH}/forum/index"
AUTH_URL = "https://class.coursera.org/#{CLASS_PATH}/auth/auth_redirector?type=login&subtype=normal"

def get_forum_links(url)
  
  b = Watir::Browser.new :chrome
  b.goto SIGNIN_URL

  sleep BROWSER_SLEEP
  b.text_field(:id => 'signin-email').value = USER
  b.text_field(:id => 'signin-password').value = PWD
  b.button(:text => 'Sign In').click
  sleep BROWSER_SLEEP
  b.goto AUTH_URL
  sleep BROWSER_SLEEP

  b.goto FORUM_HOME_URL
  
  section_links = []
  b.links.each do |link|
    if link.href.include? 'forum_id'
      section_links << link.href
    end
  end
  puts section_links.inspect
  section_links.each do |link|
    puts link
  end 
end

get_forum_links 'https://class.coursera.org/proglang-2012-001/forum/index'
