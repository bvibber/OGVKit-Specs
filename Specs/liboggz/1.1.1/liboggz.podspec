Pod::Spec.new do |s|
  name = "oggz"
  libname = "lib" + name
  ver = "1.1.1"
  libver = libname + "-" + ver
  source = "http://downloads.xiph.org/releases/" + libname + "/" + libver + ".tar.gz"
  sha1 = "3540190c8c9a31d834aa7794ef991bbab699f4de"

  s.name         = "liboggz"
  s.version      = ver
  s.summary      = "Low-level Ogg media demuxer/muxer wrapper library"

  s.description  = <<-DESC
                   Xiph's C-based Ogg media stream demuxer/muxer wrapper library, packaged for iOS.
                   DESC

  s.homepage     = "https://xiph.org/" + name + "/"

  s.license      = { :type => "BSD", :file => "COPYING" }

  s.author             = { "Brion Vibber (packager)" => "brion@pobox.com" }
  s.social_media_url   = "https://planet.xiph.org/"

  s.platform     = :ios, "6.0"

  s.source       = { :http => source,
                     :sha1 => sha1 }

  s.prepare_command = <<-CMD
                      ./configure --target=armv7-apple-darwin
                      CMD

  s.compiler_flags = "-iquote \"$PODS_ROOT/liboggz\"", # hack for use of #include "config.h" in subdirs
                     "-Wno-conversion",
                     "-Wno-unused-function",
                     "-Wno-unused-variable",
                     "-Wno-unreachable-code"

  s.source_files = "config.h",
                   "src/liboggz",
                   "include/**/*.h"
  s.public_header_files = "include/**/*.h"
  s.header_dir = name

  s.dependency 'libogg', '>=1.0'
end
