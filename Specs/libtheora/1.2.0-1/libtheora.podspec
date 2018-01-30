Pod::Spec.new do |s|
  name = "theora"
  libname = "lib" + name
  ver = "1.2.0-1"
  #libver = libname + "-" + ver
  #source = "http://downloads.xiph.org/releases/" + name + "/" + libver + ".tar.bz2"
  #sha1 = "8dcaa8e61cd86eb1244467c0b64b9ddac04ae262"

  s.name         = "libtheora"
  s.version      = ver
  s.summary      = "Low-level Theora video codec library"

  # go modular
  s.ios.deployment_target = "8.0"

  s.description  = <<-DESC
                   Xiph's C-based Theora video codec library, packaged for iOS.
                   Needed for decoding or encoding of video in Ogg media.
                   DESC

  s.homepage     = "https://xiph.org/" + name + "/"

  s.license      = { :type => "BSD", :file => "COPYING" }

  s.author             = { "Brion Vibber (packager)" => "brion@pobox.com" }
  s.social_media_url   = "https://planet.xiph.org/"

  s.platform     = :ios, "6.0"

  # Go back to this when there's a release of 1.2
  #s.source       = { :http => source,
  #                   :sha1 => sha1 }

  s.source        = { :git => "https://gitlab.xiph.org/xiph/theora.git",
                      :commit => "e5d205bfe849f1b41f45b91a0b71a3bdc6cd458f"}

  s.prepare_command = <<-'CMD'
                      echo 'framework module theora {' > theora.modulemap
                      echo '  umbrella header "theora.h"' >> theora.modulemap
                      echo '  module theoradec {' >> theora.modulemap
                      echo '    header "theoradec.h"' >> theora.modulemap
                      echo '    export *' >> theora.modulemap
                      echo '  }' >> theora.modulemap
                      echo '  module theoraenc {' >> theora.modulemap
                      echo '    header "theoraenc.h"' >> theora.modulemap
                      echo '    export *' >> theora.modulemap
                      echo '  }' >> theora.modulemap
                      echo '}' >> theora.modulemap
                      CMD

  s.compiler_flags = "-O3"
  s.source_files = "lib",
                   "include/**/*.h"
  s.exclude_files = "lib/encoder_disabled.c"
  s.public_header_files = "include/**/*.h"
  s.header_dir = name
  s.module_name = name
  s.module_map = name + ".modulemap"

  s.dependency 'libogg', '>=1.1'
end
