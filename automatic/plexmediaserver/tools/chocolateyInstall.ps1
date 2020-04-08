﻿$checksum = '9ced17182847661c6cdacf832fb59c2fc1f4f85101476713dca310ef842c94e8'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.19.1.2630-72c16a276/windows/PlexMediaServer-1.19.1.2630-72c16a276-x86.exe'

Start-CheckandStop "Plex Media Server"

$packageArgs = @{
  packageName   = 'plexmediaserver'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/quiet'
  validExitCodes= @(0)
  softwareName  = 'plexmediaserver*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

if ($ProcessWasRunning -eq "True") {&$ProcessFullPath}
