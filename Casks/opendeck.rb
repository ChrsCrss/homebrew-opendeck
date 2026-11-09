cask "opendeck" do
  arch arm: "aarch64", intel: "x64"

  version "2.14.2"
  sha256 arm:   "cb8e4592210e895abfaa92bc7093a07df4a7caa6e45745f711a5c466cb014da4",
         intel: "b5f9c75f1a8c0503726bb8f56815b659148c1f80808ef72b1f17a49e10e44b27"

  url "https://github.com/nekename/OpenDeck/releases/download/v#{version}/OpenDeck_#{version}_#{arch}.dmg"
  name "OpenDeck"
  desc "Control Elgato Stream Deck and other stream controller devices"
  homepage "https://github.com/nekename/OpenDeck"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "OpenDeck.app"

  # OpenDeck releases are ad-hoc signed and not notarized, so Gatekeeper would
  # block the first launch of every update. Drop the quarantine flag instead.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/OpenDeck.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/opendeck",
    "~/Library/Caches/opendeck",
    "~/Library/Logs/opendeck",
  ]
end
