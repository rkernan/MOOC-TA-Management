class TaMailer < ActionMailer::Base
  default :from => "pratik661@gmail.com"

  def ta_request_email(ta_test_request, site_name, site_url)
	@ta_test_request = ta_test_request	
	@site_name = site_name
	@url = site_url
	mail(:to => ta_test_request.ta_email, :subject => "Hello! We are interested in having you mentor our students")
  end

end
