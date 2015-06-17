Pod::Spec.new do |s|
  s.name         = "VPX"
  s.version      = "1.4.0"
  s.summary      = "Binary builds of Google's libvpx as an iOS framework."

  s.description  = <<-DESC
                   VPX framework built from Google's libvpx video codec library.
                   Untouched source, simply pre-built for convenience.
                   DESC

  s.homepage     = "https://github.com/brion/VPX-iOS"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Brion Vibber" => "brion@pobox.com" }
  s.social_media_url   = "https://brionv.com/"

  s.platform     = :ios, "6.0"

  s.source       = { :http => "https://github.com/brion/VPX-iOS/releases/download/1.4.0-snapshot-20150617/VPX.framework.zip" }
  s.prepare_command = <<-CMD
                      # fixme why doesn't the source fetch this?
                      if [ ! -e VPX.framework ]; then
                        wget https://github.com/brion/VPX-iOS/releases/download/1.4.0-snapshot-20150617/VPX.framework.zip
                        unzip VPX.framework.zip
                      fi
                      # fixme add this to the zip
                      if [ ! -e LICENSE ]; then
                        wget https://raw.githubusercontent.com/webmproject/libvpx/master/LICENSE
                      fi
                      CMD

  s.vendored_frameworks = "VPX.framework"
  s.frameworks = "VPX"

  s.source_files = "VPX/VPX.framework/Headers/**/*.h"
  s.public_header_files = "VPX/VPX.framework/Headers/**/*.h"
end
