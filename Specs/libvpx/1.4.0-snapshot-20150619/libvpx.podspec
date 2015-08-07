Pod::Spec.new do |s|
  ver = "1.4.0-snapshot-20150619"
  sha1 = "2b4521cc64944b5f21f1c76c42baba41f57336fa"

  s.name         = "libvpx"
  s.version      = ver
  s.summary      = "Binary builds of Google's libvpx as an iOS framework."

  s.description  = <<-DESC
                   VPX framework built from Google's libvpx video codec library.
                   Untouched source, simply pre-built for convenience.
                   DESC

  s.homepage     = "https://github.com/brion/VPX-iOS"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Brion Vibber (packager)" => "brion@pobox.com" }

  s.platform     = :ios, "6.0"

  s.source       = { :http => "https://github.com/brion/VPX-iOS/releases/download/" + ver + "/VPX-iOS.zip",
                     :sha1 => sha1,
                     :flatten => true }

  s.vendored_frameworks = "VPX.framework"
  s.frameworks = "VPX"

  s.source_files = "VPX.framework/Headers/vpx/**/*.h"
  s.public_header_files = "VPX.framework/Headers/vpx/**/*.h"
  s.header_mappings_dir = 'VPX.framework/Headers'
end
