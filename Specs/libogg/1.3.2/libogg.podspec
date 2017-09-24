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
                      echo 'framework module ogg {' > ogg.modulemap
                      echo '  umbrella header "ogg.h"' >> ogg.modulemap
                      echo '  module ogg {' >> ogg.modulemap
                      echo '    header "ogg.h"' >> ogg.modulemap
                      echo '    export *' >> ogg.modulemap
                      echo '  }' >> ogg.modulemap
                      echo '}' >> ogg.modulemap

                      cat <<PATCH1 > 0001-Work-around-iOS-dynamic-framework-build-problems.patch
                      From 88219563d2530658b64d501e15e76f907ffbab24 Mon Sep 17 00:00:00 2001
                      From: Brion Vibber <brion@pobox.com>
                      Date: Mon, 28 Mar 2016 17:20:52 -0700
                      Subject: [PATCH] Work around iOS dynamic framework build problems

                      If building with module maps (suitable for inclusion in Swift project)
                      the attempt to #include <inttypes.h> fails with a clang error:

                        Include of non-modular header inside framework module 'ogg'

                      In iOS 11 SDK and later we need to use sys/types.h instead.

                      Upstream bug: https://github.com/brion/OGVKit-Specs/issues/2
                      ---
                       include/ogg/os_types.h | 1 -
                       1 file changed, 1 deletion(-)

                      diff --git a/include/ogg/os_types.h b/include/ogg/os_types.h
                      index b8f5630..c787543 100644
                      --- a/include/ogg/os_types.h
                      +++ b/include/ogg/os_types.h
                      @@ -69,7 +69,7 @@

                       #elif (defined(__APPLE__) && defined(__MACH__)) /* MacOS X Framework build */

                      -#  include <inttypes.h>
                      +#  include <sys/types.h>
                          typedef int16_t ogg_int16_t;
                          typedef uint16_t ogg_uint16_t;
                          typedef int32_t ogg_int32_t;
                      --
                      2.7.4

                      PATCH1

                      patch -p1 < 0001-Work-around-iOS-dynamic-framework-build-problems.patch

                      CMD

  s.compiler_flags = "-O3",
                     "-Wno-conversion"
  s.source_files = "src",
                   "include/**/*.h"
  s.public_header_files = "include/**/*.h"
  s.header_dir = name
  s.module_name = name
  s.module_map = name + ".modulemap"
end
