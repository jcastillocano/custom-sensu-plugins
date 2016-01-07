#!/opt/sensu/embedded/bin/ruby
#
# check-updates
#
# DESCRIPTION:
#   Check yum updates plugin on RHEL system
#
# OUTPUT:
#  plain text
#
# PLATFORMS:
#  Linux (Fedora/CentOS/RHEL)
#

require 'sensu-plugin/check/cli'

# CheckSecurity plugin
class CheckSecurityUpdates < Sensu::Plugin::Check::CLI
  def run
    packages = []
    %x(sudo /usr/bin/yum updateinfo list security).split("\n").drop(1).each do |line|
      message line
      packages.push(line) if line =~ /^RHSA/
    end
    message "#{packages.size} security packages need to be updated"
    critical if packages.size > 0
    ok
  end
end
