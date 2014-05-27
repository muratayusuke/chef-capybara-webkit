case node[:platform_family]
when 'rhel'
  case node[:platform_version]
  when /^5./
    cookbook_file rpm_path do
      action :create
    end

    %w(libXext libGL libXrender libxml2-devel libxslt-devel).each do |pkg|
      package pkg do
        action :install
      end
    end

    # This package was created from following spec:
    # https://gist.github.com/muratayusuke/dea1658cf9d911ba55de
    rpm_name = 'qt-everywhere-opensource-src-4.8.5-el5.x86_64.rpm'
    rpm_path = "/tmp/#{rpm_name}"
    rpm_url = "http://www.muratayusuke.com/rpm/#{rpm_name}"
    remote_file rpm_path do
      source rpm_url
      owner '}root'
      group 'root'
      mode 00644
    end

    rpm_package 'qt-everywhere-opensource-src' do
      action :install
      source rpm_path
    end
  end
end
