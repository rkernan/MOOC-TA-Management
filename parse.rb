# Must have these gems installed:
require 'nokogiri'
require 'net/https'
require 'open-uri'
require 'openssl'
require 'watir-webdriver'
require 'headless'

headless = Headless.new
headless.start

USER = 'YOUR_EMAIL_HERE'
PWD = 'YOUR_PASSWORD_HERE'

BROWSER_SLEEP = 4

CLASS_PATH = 'proglang-2012-001'

SIGNIN_URL = 'https://www.coursera.org/account/signin'
FORUM_HOME_URL = "https://class.coursera.org/#{CLASS_PATH}/forum/index"
AUTH_URL = "https://class.coursera.org/#{CLASS_PATH}/auth/auth_redirector?type=login&subtype=normal"

def signin()
  # Open a browser to log user in  
  browser = Watir::Browser.new(:phantomjs)

  # Navigate to Sign In page
  browser.goto(SIGNIN_URL)
  sleep(BROWSER_SLEEP)

  # Fill in user info
  browser.text_field(:id => 'signin-email').value = USER
  browser.text_field(:id => 'signin-password').value = PWD
  browser.button(:text => 'Sign In').click

  sleep(BROWSER_SLEEP)

  # Navigate to auth page
  browser.goto(AUTH_URL)
  sleep(BROWSER_SLEEP)

  return browser
end

def get_threads(browser)

  # Get links of each sub forum
  forum_links = get_links_from_page(browser, FORUM_HOME_URL, 'forum_id')

  # Get links of every thread
  threads = []
  forum_links.each do |link|
    threads << get_links_from_page(browser, link, 'thread_id') 
  end

  return threads
end

def get_links_from_page(browser, page, link_frag)
  browser.goto(page)
  
  matching_links = browser.links.select{|link| link.href.include? link_frag}.collect{|link| link.href}
end

def rank_users(browser, threads)
  users = {}
  threads.flatten!
  puts threads.inspect
  threads.each do |thread|
    puts "Getting " << thread.to_s
    browser.goto(thread)
    students = browser.spans.select{|span| span.attribute_value("data-user-title") == "Student"}
    students.each do |student|
      user = student.text
      if users.has_key?(user)
        users[user] = users[user] + 1
      else
        users[user] = 0
      end
    end
    sleep(BROWSER_SLEEP / 2)
  end

  users = users.sort_by {|_key, value| value}
  puts users.inspect

end

browser = signin()
threads = get_threads(browser)
puts threads
rank_users(browser, threads)

browser.close
