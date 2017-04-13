# === Class: windows_ewsapi
#
# This module installs ewsapi on Windows systems. It also adds an entry to the
# PATH environment variable.
#
# === Parameters
#
# [*url*]
#   HTTP url where the installer is available. It defaults to main site.
# [*package*]
#   Package name in the system.
# [*file_path*]
#   This parameter is used to specify a local path for the installer. If it is
#   set, the remote download from $url is not performed. It defaults to false.
#
# === Examples
#
# class { 'windows_ewsapi': }
#
# class { 'windows_ewsapi':
#   $url     => 'http://192.168.1.1/files/ewsapi.exe',
#   $package => 'ewsapi version 1.8.0-preview201221022',
# }
#
# === Authors
# Vijay Tripathi <vijayt@microsoft.com>
#
# === Copyright
#
# Copyright 2016 Vijay Tripathi.
#
#
class ewsapi (
  $url       = $::ewsapi::params::url,
  $package   = $::ewsapi::params::package,
  $file_path = false,
) inherits ewsapi::params {

  if $file_path {
    $ewsapi_installer_path = $file_path
  } else {
    $package_download_dir = "${::temp}"
    $ewsapi_installer_path = "$package_download_dir\\${package}.msi"
    download_file{'ewsapi':
      url      => $url,
      destination_file => "${package}.msi",
      destination_directory => $package_download_dir
    }
  }
  package { $package:
    ensure          => installed,
    source          => $ewsapi_installer_path,
    install_options => ['/Q'],
    require         => Download_file['ewsapi']
  }
}

