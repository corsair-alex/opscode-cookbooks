#
# Cookbook Name:: rsyslog
# Attributes:: default
#
# Copyright 2009-2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['rsyslog']['log_dir']                   = '/srv/rsyslog'
default['rsyslog']['server']                    = false
default['rsyslog']['use_relp']                  = false
default['rsyslog']['relp_port']                 = 20514
default['rsyslog']['protocol']                  = 'tcp'
default['rsyslog']['port']                      = 514
default['rsyslog']['server_ip']                 = nil
default['rsyslog']['server_search']             = 'role:loghost'
default['rsyslog']['remote_logs']               = true
default['rsyslog']['per_host_dir']              = '%$YEAR%/%$MONTH%/%$DAY%/%HOSTNAME%'
default['rsyslog']['max_message_size']          = '2k'
default['rsyslog']['preserve_fqdn']             = 'off'
default['rsyslog']['high_precision_timestamps'] = false
default['rsyslog']['repeated_msg_reduction']    = 'on'
default['rsyslog']['logs_to_forward']           = '*.*'

# The most likely platform-specific attributes
default['rsyslog']['service_name']              = 'rsyslog'
default['rsyslog']['user']                      = 'root'
default['rsyslog']['group']                     = 'adm'
default['rsyslog']['priv_seperation']           = false

case node['platform']
when 'ubuntu'
  # syslog user introduced with natty package
  if node['platform_version'].to_f < 10.10
    default['rsyslog']['user'] = 'syslog'
    default['rsyslog']['group'] = 'adm'
    default['rsyslog']['priv_seperation'] = true
  end
when 'arch'
  default['rsyslog']['service_name'] = 'rsyslogd'
end
