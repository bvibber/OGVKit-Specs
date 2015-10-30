Pod::Spec.new do |s|
  ver = "1.4.0-snapshot-20151029-shared-xcode7"
  sha1 = "f3abbbe5d92881e1dfde1ad17bed4b138d9a0a70"

  s.name         = "libvpx"
  s.version      = ver
  s.summary      = "Binary builds of Google's libvpx as an iOS framework."

  s.description  = <<-DESC
                   VPX framework built from Google's libvpx video codec library.
                   Untouched source, simply pre-built for convenience.
                   DESC
  # go modular
  s.ios.deployment_target = "8.0"

  s.prepare_command = <<-'CMD'
                      (cd VPX.framework/Headers && ln -s vpx/* .)
                      CMD

  s.homepage     = "https://github.com/brion/VPX-iOS"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Brion Vibber (packager)" => "brion@pobox.com" }

  s.platform     = :ios, "6.0"

  s.source       = { :http => "https://github.com/brion/VPX-iOS/releases/download/" + ver + "/VPX-iOS.zip",
                     :sha1 => sha1,
                     :flatten => true }

  s.vendored_frameworks = "VPX.framework"
end
