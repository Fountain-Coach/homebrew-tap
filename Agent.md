Agent.md for Fountain-Coach/homebrew-tap

  Purpose

  - Provide a simple, one-line install of the Tutor CLI via Homebrew.
  - Keep the tap predictable, secure, and easy to maintain for releases.

  Repo Layout

  - Formula/tutor.rb — Homebrew formula for the Tutor CLI (Swift).
  - Optional in future:
      - /.github/workflows/ — CI to build/publish bottles with Homebrew’s test-bot.

  Prerequisites

  - macOS with Homebrew installed (brew --version).
  - Xcode / Swift toolchain installed for source builds.
  - Maintainers need push rights to the tap and tag rights to the upstream repo.

  Local Dev (test the formula)

  - Tap locally:
      - brew tap Fountain-Coach/tap https://github.com/Fountain-Coach/homebrew-tap
  - Build from source:
      - brew install --build-from-source Fountain-Coach/tap/tutor
  - Validate audit:
      - brew audit --strict --online Fountain-Coach/tap/tutor
  - Test formula:
      - brew test Fountain-Coach/tap/tutor
  - Uninstall + retest:
      - brew uninstall tutor && brew install Fountain-Coach/tap/tutor

  Formula Contents (Tutor)

  - File: Formula/tutor.rb
  - Minimal structure:
      - desc, homepage
      - url points to a tagged tarball from the upstream repo (not branch)
      - sha256 for that tarball
      - license (MIT unless changed)
      - depends_on xcode: ["16.0", :build] (adjust as needed)
      - def install
          - cd "tools/tutor-cli"
          - system "swift", "build", "-c", "release"
          - bin.install ".build/release/tutor"
      - test do
          - assert_match "tutor", shell_output("#{bin}/tutor --help")
  - Optional:
      - head block for installing from main branch (dev users).

  Release Flow (no bottles)

  1. In upstream repo (Fountain-Coach/tutor), create a new tag (e.g., v0.1.0).
  2. Compute SHA for the tarball:
      - brew fetch --build-from-source https://github.com/Fountain-Coach/tutor/archive/refs/tags/v0.1.0.tar.gz
      - Brew outputs a SHA256; copy it.
  3. Update Formula/tutor.rb:
      - Set url to the new tag tarball.
      - Set sha256 to the computed value.
  4. Local test:
      - brew install --build-from-source Fountain-Coach/tap/tutor
      - brew audit --strict --online Fountain-Coach/tap/tutor
      - brew test Fountain-Coach/tap/tutor
  5. Open PR (or push if authorized), merge on green.

  Publishing Bottles (optional, recommended)

  - Benefits: very fast installs (prebuilt binary).
  - Steps:
      - Add a GH Actions workflow using homebrew/actions/setup-homebrew + homebrew/actions/brew-test-bot.
      - On tag:
          - Run brew test-bot --only-formulae --tap=Fountain-Coach/tap --root-url=<releases-url>
          - Upload bottles as release assets; update the formula’s bottle block via test-bot.
      - Docs: https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap

  Version Bumps

  - Always point to a tagged tarball; never a mutable branch.
  - Update url, sha256, and (if present) bottle block.
  - Keep depends_on aligned with the minimal Xcode/Swift version Tutor requires.

  Security & Policy

  - Verify SHAs match the exact tarball.
  - Prefer tagged releases; avoid HEAD installs in docs (HEAD is for devs only).
  - No network during test do; use simple --help smoke checks.
  - Keep formula changes small and auditable.

  Troubleshooting

  - Build fails on user machine:
      - Ask them to confirm Xcode CLTs and swift --version.
  - “No such file …/tutor”:
      - Ensure the formula installs from tools/tutor-cli/.build/release/tutor.
  - Audit failures:
      - Run brew style and brew audit --strict --online locally; follow hints.
  - Bottles not updating:
      - Confirm test-bot permissions, release upload rights, and correct root URL.

  User Docs Snippet

  - Install: brew install Fountain-Coach/tap/tutor
  - Upgrade: brew upgrade tutor
  - Help: tutor --help

  Keep this file updated as process evolves (e.g., adding bottles or changing the toolchain requirement).
