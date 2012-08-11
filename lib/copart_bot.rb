require 'mechanize'
require 'csvparser'

class CopartBot
  def initialize
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'

    @page = @agent.get('https://member.copart.com/c2/login.html')
  end

  # This weird site after submiting the login form redirects to another page with
  # hidden form fields and submits this form via javascript. So here that action is
  # emulated and the form is submitted again in order to actually be signed in.
  def login
    login_form = @page.form_with(name: 'loginForm')
    login_form.j_username = "750436"
    login_form.j_password = "packers76*"
    @page = login_form.submit

    login_hidden_form = @page.form_with(name: 'loginForm')
    @page = login_hidden_form.submit
  end

  # Goes to the download page and push the download button
  # Returns a CSVParser object
  def get_csv_file
    @page = @page.link_with(dom_id: 'csvsaledata').click
    csv_file_form = @page.form_with(name: 'csv')

    @agent.pluggable_parser.csv = CSVParser
    @agent.submit(csv_file_form)
  end
end
