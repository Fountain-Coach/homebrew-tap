![CI](https://github.com/Fountain-Coach/homebrew-tap/actions/workflows/ci.yml/badge.svg)

**Overview**
- Homebrew tap for the Tutor CLI.
- Tutor is a Swift command‑line tool to scaffold, build, run, and test FountainAI tutorials.
- Upstream project: https://github.com/Fountain-Coach/tutor

**Install**
- HEAD (latest main; for contributors):
  - `brew install --HEAD Fountain-Coach/tap/tutor`
- Stable (when releases are published):
  - `brew install Fountain-Coach/tap/tutor`

**Requirements**
- macOS with Homebrew installed (`brew --version`).
- Xcode toolchain for source builds (currently `xcode >= 16`), used when installing from source or HEAD.

**Usage**
- Show help: `tutor --help`
- Typical flow (see upstream docs for details):
  - scaffold new tutorials, build/run locally, run tests.

**Updating**
- Upgrade: `brew upgrade tutor`
- Uninstall: `brew uninstall tutor`

**Development**
- Formula location: `Formula/tutor.rb`
- Local tap and test:
  - `brew untap Fountain-Coach/tap || true`
  - `brew tap Fountain-Coach/tap "$(pwd)"`
  - Install from HEAD: `brew install --HEAD Fountain-Coach/tap/tutor`
  - Audit & style: `brew audit --strict --online fountain-coach/tap/tutor` and `brew style Formula/*.rb`
  - Test formula: `brew test Fountain-Coach/tap/tutor`
- Releasing (stable installs):
  - Tag upstream `Fountain-Coach/tutor` (e.g., `v0.1.0`).
  - Set `url` to the tag tarball and update `sha256` in `Formula/tutor.rb`.
  - Open a PR; CI will run audit/style checks.

**Troubleshooting**
- "No available formula with the name 'tutor'": ensure the tap is added, or use the fully‑qualified name `Fountain-Coach/tap/tutor`.
- Build errors on HEAD installs: confirm Xcode/Swift toolchain is installed (`xcodebuild -version`, `swift --version`).
- Audit/style failures: run `brew audit --strict --online fountain-coach/tap/tutor` and `brew style Formula/*.rb` locally and follow suggestions.

**License**
- MIT, matching the upstream Tutor project.
