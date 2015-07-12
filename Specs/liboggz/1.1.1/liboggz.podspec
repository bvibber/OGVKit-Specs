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

  s.prepare_command = <<-'CMD'
                      echo "#define HAVE_DLFCN_H 1"\n\
                      "#define HAVE_FCNTL_H 1"\n\
                      "#define HAVE_GETOPT_LONG /**/"\n\
                      "#define HAVE_INTTYPES_H 1"\n\
                      "#define HAVE_MEMMOVE 1"\n\
                      "#define HAVE_MEMORY_H 1"\n\
                      "#define HAVE_SSIZE_T 1"\n\
                      "#define HAVE_STDINT_H 1"\n\
                      "#define HAVE_STDLIB_H 1"\n\
                      "#define HAVE_STRINGS_H 1"\n\
                      "#define HAVE_STRING_H 1"\n\
                      "#define HAVE_SYS_STAT_H 1"\n\
                      "#define HAVE_SYS_TYPES_H 1"\n\
                      "#define HAVE_UNISTD_H 1"\n\
                      "#define LT_OBJDIR \".libs/\""\n\
                      "#define OGGZ_CONFIG_READ 1"\n\
                      "#define OGGZ_CONFIG_WRITE 1"\n\
                      "#define OGGZ_OFF_MAX 0x7FFFFFFFFFFFFFFFLL"\n\
                      "#define PACKAGE \"liboggz\""\n\
                      "#define PACKAGE_BUGREPORT \"\""\n\
                      "#define PACKAGE_NAME \"\""\n\
                      "#define PACKAGE_STRING \"\""\n\
                      "#define PACKAGE_TARNAME \"\""\n\
                      "#define PACKAGE_URL \"\""\n\
                      "#define PACKAGE_VERSION """\n\
                      "#define SIZEOF_OFF_T 8"\n\
                      "#define SIZEOF_OGGZ_OFF_T 8"\n\
                      "#define SIZEOF_SSIZE_T 8"\n\
                      "#define STDC_HEADERS 1"\n\
                      "#define VERSION \"1.1.1\""\n\
                      > config.h
                      
                      echo "#ifndef __OGGZ_OFF_T_GENERATED_H__"\n\
                      "#define __OGGZ_OFF_T_GENERATED_H__"\n\
                      "#include <sys/types.h>"\n\
                      "typedef off_t oggz_off_t;"\n\
                      "#define PRI_OGGZ_OFF_T \"ll\""\n\
                      "#endif /* __OGGZ_OFF_T_GENERATED__ */"\n\
                      > include/oggz/oggz_off_t_generated.h
                      
                      CMD

  s.compiler_flags = "-iquote \"$PODS_ROOT/liboggz\"", # hack for use of #include "config.h" in subdirs
                     "-Wno-conversion",
                     "-Wno-unused-function",
                     "-Wno-unused-variable",
                     "-Wno-unreachable-code",
                     "-Wno-format"

  s.source_files = "config.h",
                   "src/liboggz",
                   "include/**/*.h"
  s.public_header_files = "include/**/*.h"
  s.header_dir = name

  s.dependency 'libogg', '>=1.0'
end
