cask "yowl" do
  version "1.3.1"
  sha256 "0477f6fa3f6cbb832d3df6bb4005e767b35a7345a2bb24ed99ac9df98470120b"

  url "https://github.com/nejcar20/yowl/releases/download/v#{version}/Yowl-#{version}.dmg"
  name "Yowl"
  desc "Menu bar theft alarm for MacBooks"
  homepage "https://dontstealmylaptop.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Yowl.app"

  uninstall quit: "com.jernejkocica.yowl"

  # The sudoers rule is deliberately not removed here. zap runs as the invoking
  # user and the file is root-owned in /etc, so a rule written here would either
  # fail silently or need brew to prompt for a password, and a package manager
  # silently editing /etc/sudoers.d is worse than leaving one line behind.
  # Unticking the setting inside the app removes it properly.
  zap trash: [
    "~/Library/Application Support/Yowl",
    "~/Library/Caches/com.jernejkocica.yowl",
    "~/Library/Preferences/com.jernejkocica.yowl.plist",
  ]

  caveats <<~EOS
    Yowl lives in the menu bar. There is no Dock icon and no window: look for
    the shield.

    If you turn on "keep the siren audible with the lid closed", Yowl asks for
    your administrator password once and installs a sudoers rule at
    /etc/sudoers.d/yowl-disablesleep allowing exactly two commands:

      /usr/bin/pmset -a disablesleep 1
      /usr/bin/pmset -a disablesleep 0

    Unticking that setting removes the file. `brew uninstall` does not, because
    it would mean a package manager editing /etc/sudoers.d on your behalf.
    To remove it by hand:

      sudo rm /etc/sudoers.d/yowl-disablesleep
  EOS
end
