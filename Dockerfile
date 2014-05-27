FROM muratayusuke/centos5.8:chef-solo-berks

ENV LANG C.UTF-8

# run chef-solo
RUN mkdir -p /tmp/capybara-webkit
ADD ./solo.rb /etc/chef/solo.rb
ADD ./node.json /etc/chef/node.json
ADD ./Berksfile /tmp/capybara-webkit/Berksfile
ADD ./attributes /tmp/capybara-webkit/attributes
ADD ./recipes /tmp/capybara-webkit/recipes
ADD ./install_cmds.sh /tmp/capybara-webkit/install_cmds.sh
ADD ./metadata.rb /tmp/capybara-webkit/metadata.rb
ADD ./README.md /tmp/capybara-webkit/README.md
RUN /tmp/capybara-webkit/install_cmds.sh

# install test
RUN NOKOGIRI_USE_SYSTEM_LIBRARIES=1 /opt/chef/embedded/bin/gem install capybara-webkit
