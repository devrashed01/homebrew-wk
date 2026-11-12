cask "wk" do
  version "0.2.8"
  sha256 "c10bea7b27936dbfb8fb90563f7a2300e84d7651854ace139c5b5bb3fa60bdb0"

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
