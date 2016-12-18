Pod::Spec.new do |s|
  ver = "1.0.0"
  sha1 = "403861aa6ee7abc446f9515d9bb613ac03ce51b0"

  s.name         = "WebM"
  s.version      = ver
  s.summary      = "Binary builds of Google's libwebm as an iOS framework."

  s.description  = <<-DESC
                   WebM framework built from Google's libwebm demuxer/muxer library.
                   Untouched source, pre-built for convenience.
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
