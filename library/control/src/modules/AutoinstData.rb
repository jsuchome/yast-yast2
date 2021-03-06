# encoding: utf-8

# ***************************************************************************
#
# Copyright (c) 2002 - 2012 Novell, Inc.
# All Rights Reserved.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.   See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, contact Novell, Inc.
#
# To contact Novell about this file by physical or electronic mail,
# you may find current contact information at www.novell.com
#
# ***************************************************************************
# File:	modules/AutoinstData.ycp
# Package:	Autoyast
# Summary:	Data storage for Autoinstallation
# Authors:	Anas Nashif <nashif@suse.de>
#		Uwe Gansert <ug@suse.de>
#		Lukas Ocilka <locilka@suse.cz>
#
# $Id$
require "yast"

module Yast
  class AutoinstDataClass < Module
    def main
      # Moved here from AutoinstGeneral.ycp

      #
      # Keyboard
      #
      #global map keyboard = $[];

      #
      # Language
      #
      #global string language = "";

      #
      # Mouse, if not autoprobed
      #
      @mouse = {}

      #
      # Clock Settings
      #
      #global map Clock = $[];


      # Moved here from AutoinstSoftware.ycp

      # Packages that should be installed in continue mode
      @post_packages = []

      # Patterns that should be installed in continue mode
      @post_patterns = []

      # Moved here from AutoinstStorage.ycp

      # Show warning for /boot cyl <1024
      @BootCylWarning = true

      # Show warning for /boot on raid
      @BootRaidWarning = true

      # Show warning for /boot on lvm
      @BootLVMWarning = true
    end

    publish :variable => :mouse, :type => "map"
    publish :variable => :post_packages, :type => "list <string>"
    publish :variable => :post_patterns, :type => "list <string>"
    publish :variable => :BootCylWarning, :type => "boolean"
    publish :variable => :BootRaidWarning, :type => "boolean"
    publish :variable => :BootLVMWarning, :type => "boolean"
  end

  AutoinstData = AutoinstDataClass.new
  AutoinstData.main
end
