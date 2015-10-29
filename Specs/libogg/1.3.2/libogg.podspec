Pod::Spec.new do |s|
  name = "ogg"
  libname = "lib" + name
  ver = "1.3.2"
  libver = libname + "-" + ver
  source = "http://downloads.xiph.org/releases/" + name + "/" + libver + ".tar.xz"
  sha1 = "5e525ec6a4135066932935c01d2c309ea5009f8d"

  s.name         = "libogg"
  s.version      = ver
  s.summary      = "Low-level media demuxer/muxer library"

  # go modular
  s.ios.deployment_target = "8.0"

  s.description  = <<-DESC
                   Xiph's C-based Ogg media stream demuxer/muxer library, packaged for iOS.
                   Needed for decoding or encoding of Ogg Theora video and Vorbis audio.
                   DESC

  s.homepage     = "https://xiph.org/" + name + "/"

  s.license      = { :type => "BSD", :file => "COPYING" }

  s.author             = { "Brion Vibber (packager)" => "brion@pobox.com" }
  s.social_media_url   = "https://planet.xiph.org/"

  s.platform     = :ios, "6.0"

  s.source       = { :http => source,
                     :sha1 => sha1 }

  s.prepare_command = <<-'CMD'
                      echo 'framework module ogg {' > include/ogg/ogg.modulemap
                      echo '  umbrella header "ogg.h"' >> include/ogg/ogg.modulemap
                      echo '  ' >> include/ogg/ogg.modulemap
                      echo '  export *' >> include/ogg/ogg.modulemap
                      echo '  module * { export * }' >> include/ogg/ogg.modulemap
                      echo '}' >> include/ogg/ogg.modulemap
                      CMD

  s.compiler_flags = "-O3",
                     "-Wno-conversion"
  s.source_files = "src",
                   "include/**/*.h"
  s.public_header_files = "include/**/*.h"
  s.header_dir = name
  s.module_name = "ogg"
  s.module_map = "include/ogg/oggx.modulemap"
end
