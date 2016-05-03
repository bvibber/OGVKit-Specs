Pod::Spec.new do |s|
  ver = "1.5.0-snapshot-20160503"
  sha1 = "0c04b814ec456daa7033193b2cb53d1eaa5b0810"

  s.name         = "libvpx"
  s.version      = ver
  s.summary      = "Binary builds of Google's libvpx as an iOS framework."

  s.description  = <<-DESC
                   VPX framework built from Google's libvpx video codec library.
                   Slightly tweaked source for build fixes, pre-built for convenience.
                   DESC

  s.prepare_command = <<-'CMD'
                      (cd VPX.framework/Headers && ln -s vpx/* .)
                      CMD

  s.homepage     = "https://github.com/brion/VPX-iOS"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Brion Vibber (packager)" => "brion@pobox.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :http => "https://github.com/brion/VPX-iOS/releases/download/" + ver + "/VPX-iOS.zip",
                     :sha1 => sha1,
                     :flatten => true }

  s.vendored_frameworks = "VPX.framework"
end
