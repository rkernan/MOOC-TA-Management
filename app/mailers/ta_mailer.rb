class TaMailer < ActionMailer::Base
  default :from => "pratik661@gmail.com"

  def ta_request_email(ta_test_request, site_name, site_url)
	@ta_test_request = ta_test_request	
	@site_name = site_name
	@url = site_url
	mail(:to => ta_test_request.ta_email, :subject => "Hello! We are interested in having you mentor our students")
  end

  def ta_class_request_email(professor_name, course, ta_email, ta_name, site_name)
	@professor_name = professor_name
	@course = course
	@ta_email
	@ta_name
	@site_name
	mail(:to => ta_email, :subject => "Hello! We are interested in having you mentor our students")
  end

end
