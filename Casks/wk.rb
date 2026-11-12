cask "wk" do
  version "0.2.6"
  sha256 "44c066e3dfe86f2a3a92f3b57ac0c515887c66c29bda464e8fe2a45ad24ad400"

  url "https://github.com/devrashed01/wk/releases/download/v#{version}/Wk-#{version}-macos.zip"
  name "Wk"
  desc "Switcher for git worktrees and Claude Code sessions, built on cmux"
  homepage "https://devrashed01.github.io/wk/"

  depends_on macos: ">= :sonoma"

  app "Wk.app"
  binary "#{appdir}/Wk.app/Contents/Resources/wk"

  # The app is signed but not notarized; without this macOS refuses to open it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Wk.app"]
  end

  uninstall quit: "com.devrashed01.wk"

  zap trash: [
    "~/.cache/wk",
    "~/.config/wk",
    "~/.local/state/wk",
  ]
end
