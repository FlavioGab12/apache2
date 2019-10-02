include_controls 'apache2-integration-tests' do
  skip_control 'welcome-page'
end

control 'responds on 8080' do
  impact 1
  desc 'Apache should respond on on port 8080'

  describe http('http://127.0.0.1:8080') do
    its('status') { should eq 403 }
    its('body') { should cmp /Apache Server/ }
  end
end
