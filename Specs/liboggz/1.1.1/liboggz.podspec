Pod::Spec.new do |s|
  name = "oggz"
  libname = "lib" + name
  ver = "1.1.1"
  libver = libname + "-" + ver
  source = "https://downloads.xiph.org/releases/" + libname + "/" + libver + ".tar.gz"
  sha1 = "3540190c8c9a31d834aa7794ef991bbab699f4de"

  s.name         = "liboggz"
  s.version      = ver
  s.summary      = "Low-level Ogg media demuxer/muxer wrapper library"

  s.description  = <<-DESC
                   Xiph's C-based Ogg media stream demuxer/muxer wrapper library, packaged for iOS.
                   DESC

  # go modular
  s.ios.deployment_target = "8.0"

  s.homepage     = "https://xiph.org/" + name + "/"

  s.license      = { :type => "BSD", :file => "COPYING" }

  s.author             = { "Brion Vibber (packager)" => "brion@pobox.com" }
  s.social_media_url   = "https://planet.xiph.org/"

  s.platform     = :ios, "8.0"

  s.source       = { :http => source,
                     :sha1 => sha1 }

  s.prepare_command = <<-'CMD'
                      echo '#define HAVE_DLFCN_H 1' > config.h
                      echo '#define HAVE_FCNTL_H 1' >> config.h
                      echo '#define HAVE_GETOPT_LONG /**/' >> config.h
                      echo '#define HAVE_INTTYPES_H 1' >> config.h
                      echo '#define HAVE_MEMMOVE 1' >> config.h
                      echo '#define HAVE_MEMORY_H 1' >> config.h
                      echo '#define HAVE_SSIZE_T 1' >> config.h
                      echo '#define HAVE_STDINT_H 1' >> config.h
                      echo '#define HAVE_STDLIB_H 1' >> config.h
                      echo '#define HAVE_STRINGS_H 1' >> config.h
                      echo '#define HAVE_STRING_H 1' >> config.h
                      echo '#define HAVE_SYS_STAT_H 1' >> config.h
                      echo '#define HAVE_SYS_TYPES_H 1' >> config.h
                      echo '#define HAVE_UNISTD_H 1' >> config.h
                      echo '#define LT_OBJDIR ".libs/"' >> config.h
                      echo '#define OGGZ_CONFIG_READ 1' >> config.h
                      echo '#define OGGZ_CONFIG_WRITE 1' >> config.h
                      echo '#define OGGZ_OFF_MAX 0x7FFFFFFFFFFFFFFFLL' >> config.h
                      echo '#define PACKAGE "liboggz"' >> config.h
                      echo '#define PACKAGE_BUGREPORT ""' >> config.h
                      echo '#define PACKAGE_NAME ""' >> config.h
                      echo '#define PACKAGE_STRING ""' >> config.h
                      echo '#define PACKAGE_TARNAME ""' >> config.h
                      echo '#define PACKAGE_URL ""' >> config.h
                      echo '#define PACKAGE_VERSION ""' >> config.h
                      echo '#define SIZEOF_OFF_T 8' >> config.h
                      echo '#define SIZEOF_OGGZ_OFF_T 8' >> config.h
                      echo '#define SIZEOF_SSIZE_T 8' >> config.h
                      echo '#define STDC_HEADERS 1' >> config.h
                      echo '#define VERSION "1.1.1"' >> config.h
                      
                      echo '#ifndef __OGGZ_OFF_T_GENERATED_H__' > include/oggz/oggz_off_t_generated.h
                      echo '#define __OGGZ_OFF_T_GENERATED_H__' >> include/oggz/oggz_off_t_generated.h
                      echo '#include <sys/types.h>' >> include/oggz/oggz_off_t_generated.h
                      echo 'typedef off_t oggz_off_t;' >> include/oggz/oggz_off_t_generated.h
                      echo '#define PRI_OGGZ_OFF_T "ll"' >> include/oggz/oggz_off_t_generated.h
                      echo '#endif /* __OGGZ_OFF_T_GENERATED__ */' >> include/oggz/oggz_off_t_generated.h
                      
                      echo 'framework module oggz {' > oggz.modulemap
                      echo '  umbrella header "oggz.h"' >> oggz.modulemap
                      echo '  module oggz {' >> oggz.modulemap
                      echo '    header "oggz.h"' >> oggz.modulemap
                      echo '    export *' >> oggz.modulemap
                      echo '  }' >> oggz.modulemap
                      echo '}' >> oggz.modulemap
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
  s.module_name = name
  s.module_map = name + ".modulemap"

  s.dependency 'libogg', '>=1.0'
end
