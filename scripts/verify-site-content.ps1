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
  "产业数字化产品"
)

$requiredIndex = @(
  "通用软件开发实习生",
  "Python",
  "数据处理",
  "优化建模",
  "工程基础",
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

Write-Output "Site content verification passed."

