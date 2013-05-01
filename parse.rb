# Must have these gems installed:
require 'lingua'
require 'nokogiri'
require 'net/https'
require 'open-uri'
require 'openssl'
require 'watir-webdriver'
require 'headless'
require 'io/console'
require 'rubygems'
require 'active_record'
require 'cgi'
require 'uri'
require 'bigdecimal'
require 'bigdecimal/util'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/development.sqlite3')

class ParseResult < ActiveRecord::Base
  attr_accessible :name, :user_id, :activity, :fog, :kincaid, :flesch, :course_path, :ta_id
end

headless = Headless.new
headless.start

BROWSER_SLEEP = 4

CLASS_PATH = 'proglang-2012-001'

SIGNIN_URL = 'https://www.coursera.org/account/signin'
FORUM_HOME_URL = "https://class.coursera.org/#{CLASS_PATH}/forum/index"
AUTH_URL = "https://class.coursera.org/#{CLASS_PATH}/auth/auth_redirector?type=login&subtype=normal"

activity = 0
fog = 0
pending = true

def signin(email, password)
  # Open a browser to log user in  
  browser = Watir::Browser.new(:phantomjs)

  # Navigate to Sign In page
  browser.goto(SIGNIN_URL)
  sleep(BROWSER_SLEEP)

  # Fill in user info
  browser.text_field(:id => 'signin-email').value = email
  browser.text_field(:id => 'signin-password').value = password
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
    sleep(BROWSER_SLEEP / 4)
  end

  return threads
end

def get_links_from_page(browser, page, link_frag)
  puts "Indexing " << page.to_s
  browser.goto(page)
  sleep(BROWSER_SLEEP / 4)
  browser.links.each do |link|
    link.href.to_s
  end
  #matching_links = browser.links.select{|link| link.href.include? link_frag}.collect{|link| link.href}
  matching_links = browser.links.collect{|link| link.href}.select{|href| href.include? link_frag}
end

def rank_users(browser, threads)
  users = {}
  ids = []
  threads.flatten!
  total_threads = threads.size
  threads.each_with_index do |thread, index|
    puts "[" << index.to_s << "/" << total_threads.to_s << "] Analyzing " << thread.to_s
    browser.goto(thread)

    posts = browser.divs(:class => "course-forum-post-view-container")
    posts.each do |post|
      student_link = post.links.select{|link| link.href.include? "user_id"}[0]
      if student_link
        post_text_div = post.divs(:class => "course-forum-post-text")[0]
        post_text = ""
        if post_text_div.ps.length > 0
          post_text_div.ps.each do |p|
            post_text << p.text 
          end
        else
          post_text = post_text_div.text
        end
        report = Lingua::EN::Readability.new(post_text.to_s)
        report.inspect
        username = student_link.text.titleize
        id = CGI::parse(URI.parse(student_link.href).query)["user_id"][0]
        if users.has_key?(id)
          user = users[id]
        else
          user = {}
          user["name"] = username
          ids << id
          user["activity"] = 0
          user["fogs"] = 0
          user["kincaids"] = 0
          user["fleschs"] = 0
          user["fog"] = 0
          user["kincaid"] = 0
          user["flesch"] = 0
          user["id"] = id
        end

        if !report.fog.nan?
          user["fog"] = user["fog"] + report.fog
          user["fogs"] = user["fogs"] + 1
        end

        if !report.kincaid.nan?
          user["kincaid"] = user["kincaid"] + report.kincaid
          user["kincaids"] = user["kincaids"] + 1
        end
        
        if !report.flesch.nan?
          user["flesch"] = user["flesch"] + report.flesch
          user["felschs"] = user["fleschs"] + 1
        end
        user["activity"] = user["activity"] + 1
        users[id] = user
      end

    end
    sleep(BROWSER_SLEEP / 4)
  end

  ids.each do |id|
    user = users[id]
    p = ParseResult.new
    p.name = user["name"]
    p.user_id = id
    p.activity = user["activity"]
    if user["fogs"] != 0
      p.fog = user["fog"].to_i / user["fogs"]
    end
    if user["kincaids"] != 0
      p.kincaid = user["kincaid"].to_i / user["kincaids"]
    end
    if user["fleschs"] != 0
      p.flesch = user["flesch"].to_i / user["fleschs"]
    end
    p.course_path = CLASS_PATH
    p.save
  end

end

#print "Coursera email: "
#email = gets.chomp
#print "Coursera password: "
#password = STDIN.noecho(&:gets).chomp
email = ""
password = ""

browser = signin(email, password)
threads = get_threads(browser)
rank_users(browser, threads)

browser.close
