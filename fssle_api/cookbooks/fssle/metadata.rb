maintainer       "lite"
maintainer_email "litekok@gmail.com"
description      "Installs/Configures Fssle"

recipe "fssle", "Installs Fssle"

depends "apt"
depends "curl"
depends "git-core"
depends "aws"
depends "libxml2-dev"

supports "debian"
