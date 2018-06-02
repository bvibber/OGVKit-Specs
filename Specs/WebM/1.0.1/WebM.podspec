Pod::Spec.new do |s|
  ver = "1.0.1"
  sha1 = "f1a0a5d951a309328e77d19575710b316dc92515"

  s.name         = "WebM"
  s.version      = ver
  s.summary      = "Binary builds of Google's libwebm as an iOS framework."

  s.description  = <<-DESC
                   WebM framework built from Google's libwebm demuxer/muxer library.
                   Source slightly modified to fix build, header issues.
                   DESC

  s.homepage     = "https://github.com/brion/WebM-iOS"

  s.license      = { :type => "MIT", :file => "LICENSE.TXT" }

  s.author             = { "Brion Vibber (packager)" => "brion@pobox.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :http => "https://github.com/brion/WebM-iOS/releases/download/" + ver + "/WebM-iOS.zip",
                     :sha1 => sha1,
                     :flatten => true }

  s.vendored_frameworks = "WebM.framework"
end
