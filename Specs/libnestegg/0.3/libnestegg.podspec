Pod::Spec.new do |s|
  name = 'nestegg'
  libname = "lib" + name

  s.name         = libname
  s.version      = "0.3"
  s.summary      = "Low-level WebM video container parser library"

  s.description  = <<-DESC
                   C-based low-level WebM video container parser library by Mozilla
                   DESC

  s.homepage     = "https://github.com/kinetiknz/nestegg"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Brion Vibber (packager)" => "brion@pobox.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/kinetiknz/nestegg.git",
                     :commit => "89ed0daf2edccb25f744e5faff88b8b4684adceb" }

  s.prepare_command = <<-CMD
                      echo 'framework module nestegg {' > nestegg.modulemap
                      echo '  umbrella header "nestegg.h"' >> nestegg.modulemap
                      echo '  module nestegg {' >> nestegg.modulemap
                      echo '    header "nestegg.h"' >> nestegg.modulemap
                      echo '    export *' >> nestegg.modulemap
                      echo '  }' >> nestegg.modulemap
                      echo '}' >> nestegg.modulemap
                      CMD


  s.source_files = "include/**/*.h",
                   "src/**/*.c",
                   "halloc/**/*.{c,h}"
  s.public_header_files = "include/**/*.h"
  s.header_dir = name
  s.module_name = name
  s.module_map = name + ".modulemap"

  s.compiler_flags = "-Wno-conversion"
end
