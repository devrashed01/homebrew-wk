cask "wk" do
  version "0.6.2"
  sha256 "caa92ef606c49ee233a68d900bddd9751912e34a80b8afcca5bef87d4a887f81"

  url "https://github.com/devrashed01/wk/releases/download/v#{version}/Wk-#{version}-macos.zip"
  name "Wk"
  desc "Switcher for git worktrees and Claude Code sessions, built on cmux"
  homepage "https://devrashed01.github.io/wk/"

  depends_on macos: :sonoma

  app "Wk.app"
  binary "#{appdir}/Wk.app/Contents/Resources/wk"

  # The app is signed but not notarized; without this macOS refuses to open it.
  installed_app = "#{appdir}/Wk.app"
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", installed_app],
        must_succeed:   false,
        writable_paths: [installed_app]
  end

  uninstall quit: "com.devrashed01.wk"

  zap trash: [
    "~/.cache/wk",
    "~/.config/wk",
    "~/.local/state/wk",
  ]
end
