cask "kuaishou-kim" do
  arch arm: "-arm"

  version "5.0.6,59724"
  sha256 arm:   "b955b43d39f83084a927b7a1d39d18e8ef7e25239c17a513774edb0ee375a7ca",
         intel: "228d344c7bb54e56e04554f53f6b281c54f588ec89701d9256be17be910ebe58"

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
