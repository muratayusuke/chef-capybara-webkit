export PATH=$PATH:/opt/chef/embedded/bin/
cd /tmp/capybara-webkit
berks vendor /etc/chef/cookbooks/
chef-solo
