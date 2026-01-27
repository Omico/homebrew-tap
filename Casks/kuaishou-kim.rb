cask "kuaishou-kim" do
  arch arm: "-arm"

  version "5.0.7,59888"
  sha256 arm:   "a1f293b61f2d9aacf90dd74a04c4c01c31324bbfd5e0ad2085bc445ca27cf565",
         intel: "81010cc5b863e0c0f0a27d996e2b0806e47750ec4c53ab51ad546cd441407b0d"

  url "https://kim.static.yximgs.com/udata/pkg/kim-install/Kim-#{version.csv.first}-#{version.csv.second}#{arch}.dmg",
      verified: "kim.static.yximgs.com/udata/pkg/kim-install/"
  name "Kim"
  desc "Empower Efficiency with Collaboration"
  homepage "https://kim.kuaishou.com/"

  livecheck do
    url "https://kim.kuaishou.com/mis/deploy/version/v2/appDownloadUrl?type=darwin#{arch}"
    regex(/Kim[._-](\d+(?:\.\d+)+)[._-](\d+)(?:-arm)?\.dmg/i)
    strategy :json do |json, regex|
      json.map do |_|
        url = json.dig("data", "format")
        match = url&.match(regex)
        next if match.nil?

        "#{match[1]},#{match[2]}"
      end
    end
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Kim.app"

  uninstall quit: "Kem"

  zap trash: [
    "~/Library/Application Support/Kim (Kim)",
    "~/Library/Application Support/Kim",
    "~/Library/Logs/Kim",
    "~/Library/Preferences/Kem.plist",
  ]
end
