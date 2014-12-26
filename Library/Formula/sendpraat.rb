require 'formula'

class Sendpraat < Formula
  homepage "http://www.fon.hum.uva.nl/praat/sendpraat.html"
  url "http://www.fon.hum.uva.nl/praat/sendpraat.c"
  version "2013.04.25"
  sha1 "9249d157de600bb63635b110ba55727a8bd6f1c0"

  def install
    system "cc", "-o", "sendpraat", "-DSTAND_ALONE", "-framework", "CoreServices",
      "-I/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/AE.framework/Versions/A/Headers",
      "-I/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/Headers",
      "sendpraat.c", "-Dmacintosh", "-DuseCarbon=1"
    bin.install "sendpraat"
  end

  test do
    system "#{bin}/sendpraat"
  end
end
