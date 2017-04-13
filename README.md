puppet-windows_ewsapi
==============
This module installs ewsapi on Windows machines, adding the binary to the PATH environemnt variable.

Basic usage
-----------
The basic scenario allows the user to install ewsapi fetching the installer from the main site:

    class { 'windows_ewsapi': }

It is also possible to specify an alternative remote URL:

    class { 'windows_ewsapi':
      $url => 'http://192.168.1.1/files/ewsapi_installer.exe',
    }

Finally, it is also possible to specify a local path where the installer is available:

    class { 'windows_ewsapi':
      $file_path => 'F:/Shared/Software/ewsapi.exe',
    }

Contributors
------------
 * Vijay Tripathi <vijayt@microsoft.com>


