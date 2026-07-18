$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$files = @(
  (Join-Path $root "index.html"),
  (Join-Path $root "projects/mining-case.html")
)

$requiredAssets = @(
  (Join-Path $root "assets/images/neu-logo.png")
)

$forbidden = @(
  "产品经理",
  "产品作品集",
  "Product Management",
  "Product Manager",
  "product manager",
  "AI 产品",
  "产业数字化产品",
  "通用软件开发实习生",
  "Software Developer Internship",
  "欢迎交流软件开发实习机会"
)

$requiredIndex = @(
  "央国企技术与管理岗位",
  "生产运营与数字化",
  "State-owned Enterprise Career",
  "校园经历",
  "科学技术协会办公室副部长",
  "教学办学生助理",
  "人文艺术中心部员",
  "自动化类 2005 班组织委员",
  "连续两年东北大学优秀学生一等奖学金",
  "未来太湖科技奖学金",
  "最具影响力毕业生",
  "Python",
  "数据处理",
  "生产优化",
  "流程规范",
  "1046649659@qq.com",
  "https://github.com/1046649659-cmyk",
  "Resume.pdf",
  "projects/mining-case.html",
  "assets/images/neu-logo.png",
  "东北大学校徽"
)

$requiredCase = @(
  "矿业生产链和产业链智能协同与优化研究",
  "HMM",
  "场景生成",
  "综合评估",
  "Python",
  "技术项目"
)

$requiredHomeCss = @(
  "grid-template-columns: 150px minmax(0, 1fr)",
  "gap: 24px",
  "width: 150px",
  "height: 190px",
  "object-fit: contain"
)

foreach ($file in $files) {
  if (-not (Test-Path -LiteralPath $file)) {
    throw "Missing required file: $file"
  }
}

foreach ($asset in $requiredAssets) {
  if (-not (Test-Path -LiteralPath $asset)) {
    throw "Missing required asset: $asset"
  }
}

$combined = ($files | ForEach-Object { Get-Content -LiteralPath $_ -Raw -Encoding UTF8 }) -join "`n"
foreach ($term in $forbidden) {
  if ($combined.Contains($term)) {
    throw "Forbidden product wording found: $term"
  }
}

$index = Get-Content -LiteralPath (Join-Path $root "index.html") -Raw -Encoding UTF8
foreach ($term in $requiredIndex) {
  if (-not $index.Contains($term)) {
    throw "Missing homepage required content: $term"
  }
}

$case = Get-Content -LiteralPath (Join-Path $root "projects/mining-case.html") -Raw -Encoding UTF8
foreach ($term in $requiredCase) {
  if (-not $case.Contains($term)) {
    throw "Missing case-page required content: $term"
  }
}

$homeCss = Get-Content -LiteralPath (Join-Path $root "home.css") -Raw -Encoding UTF8
foreach ($term in $requiredHomeCss) {
  if (-not $homeCss.Contains($term)) {
    throw "Missing hero photo CSS requirement: $term"
  }
}

Write-Output "Site content verification passed."

