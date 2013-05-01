class TaMailer < ActionMailer::Base
  default :from => "mooctamanager@gmail.com"

  def ta_class_request_email(professor_email, course, ta_email, site_name)
	@professor_email = professor_email
	@course = course
	@ta_email=ta_email
	@site_name=site_name
	mail(:to => ta_email, :subject => "Hello! We are interested in having you mentor our students")
  end

end
