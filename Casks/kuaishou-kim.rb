cask "kuaishou-kim" do
  arch arm: "-arm"

  version "5.0.5,59640"
  sha256 arm:   "9b15259e79e8ba6a8ab7d9c22d9e6196b1838b18b2df8abd425a9118fc3379f4",
         intel: "cf734aa9bbf1f44f820e00f9f12a476594ebc45081bf7228902481886c17be37"

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
