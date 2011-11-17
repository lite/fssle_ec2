maintainer       "lite"
maintainer_email "litekok@gmail.com"
description      "Installs/Configures Fssle"

recipe "fssle", "Installs Fssle"

depends "apt"
depends "aws"
depends "build-essential"
depends "apache2"

%w{ redhat centos ubuntu debian }.each do |os|
    supports os
end

