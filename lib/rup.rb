#!/usr/bin/env ruby

# Copyright (C) 2009 Otype.de
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# GLOBALS
#
$COMMAND_NAME = "rup"
$VERSION = "0.3.2"

# Required for LibConfig
$CONFIGDIR = ENV['HOME'] + "/.rup"
$CONFIGFILE = $CONFIGDIR + "/repositories.cfg"

# Require all files
Dir[File.dirname(__FILE__) << "/**/*.rb"].each do |file|
  require file
end


