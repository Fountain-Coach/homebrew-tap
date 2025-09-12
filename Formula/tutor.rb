class Tutor < Formula
  desc "Swift CLI to scaffold, build, run, and test FountainAI tutorials"
  homepage "https://github.com/Fountain-Coach/tutor"
  head "https://github.com/Fountain-Coach/tutor.git", branch: "main"
  license "MIT"

  depends_on xcode: ["16.0", :build]

  def install
    cd "tools/tutor-cli" do
      system "swift", "build", "-c", "release"
      bin.install ".build/release/tutor"
    end
  end

  test do
    assert_match "tutor", shell_output("#{bin}/tutor --help")
  end
end
