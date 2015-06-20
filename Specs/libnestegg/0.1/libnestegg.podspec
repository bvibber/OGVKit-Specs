Pod::Spec.new do |s|
  s.name         = "libnestegg"
  s.version      = "0.1"
  s.summary      = "Low-level WebM video container parser library"

  s.description  = <<-DESC
                   C-based low-level WebM video container parser library by Mozilla
                   DESC

  s.homepage     = "https://github.com/kinetiknz/nestegg"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Brion Vibber (packager)" => "brion@pobox.com" }

  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/kinetiknz/nestegg.git",
                     :commit => "db8617b19d181fa31090e01d99f969bd5959a9c3" }

  s.prepare_command = <<-CMD
                      echo "#define _STDINT_HAVE_STDINT_H 1\\n#include <stdint.h>" > include/nestegg/nestegg-stdint.h
                      CMD

  s.source_files = "include/**/*.h",
                   "src/**/*.c",
                   "halloc/**/*.{c,h}"
  s.public_header_files = "include/**/*.h"
  s.header_dir = 'nestegg'

  s.compiler_flags = "-Wno-conversion"
end
