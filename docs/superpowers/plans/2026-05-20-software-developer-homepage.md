# Software Developer Homepage Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Convert Wang Jingbo's GitHub Pages site into a software developer internship homepage with no product-manager positioning.

**Architecture:** Keep the existing static GitHub Pages structure. Rewrite `index.html` and `projects/mining-case.html` as plain HTML pages, then adjust existing CSS only where needed to support the new technical resume homepage sections.

**Tech Stack:** Static HTML, CSS, GitHub Pages, PowerShell verification scripts.

---

## File Structure

- Modify: `index.html`
  - Main personal homepage for software development internship recruiting.
  - Owns hero, about, projects, internship, skills, education, achievements, and contact sections.
- Modify: `projects/mining-case.html`
  - Technical detail page for the mining production planning optimization project.
  - Owns project background, workflow, responsibilities, technical modules, and results.
- Modify: `styles.css`
  - Shared base layout, typography, buttons, header, and responsive utilities.
- Modify: `home.css`
  - Homepage-specific sections and project cards.
- Modify: `case.css`
  - Technical project detail page-specific layout.
- Keep: `assets/images/headshot.jpg`
  - Existing profile photo.
- Keep: `Resume.pdf`
  - Downloadable resume.
- Create: `scripts/verify-site-content.ps1`
  - Content and link verification script for static files.

## Task 1: Add Content Verification Script

**Files:**
- Create: `scripts/verify-site-content.ps1`

- [ ] **Step 1: Create the failing verification script**

Create `scripts/verify-site-content.ps1` with this content:

```powershell
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$files = @(
  Join-Path $root "index.html",
  Join-Path $root "projects/mining-case.html"
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
  "projects/mining-case.html"
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
```

- [ ] **Step 2: Run the script and verify it fails**

Run:

```powershell
.\scripts\verify-site-content.ps1
```

Expected: FAIL with a forbidden product wording message from the current site content.

- [ ] **Step 3: Commit the verification script**

Run:

```powershell
git add scripts/verify-site-content.ps1
git commit -m "Add site content verification"
```

## Task 2: Rewrite Homepage Content

**Files:**
- Modify: `index.html`
- Modify: `home.css`
- Modify: `styles.css`

- [ ] **Step 1: Replace `index.html` with the software developer homepage**

Rewrite the page to include:

- Title: `王敬博 | 软件开发实习生`
- Meta description focused on Python, data processing, optimization modeling, and engineering basics.
- Header links: About, Projects, Experience, Skills, Education, Contact.
- Hero with existing headshot, Wang Jingbo / 王敬博, Northeastern University master's student, target role, email, GitHub link, and resume link.
- About section with software development direction.
- Project cards for mining optimization and steel production planning optimization.
- Internship section for BMW Brilliance.
- Skills section grouped by Python, algorithms, engineering practice, network basics, and tools.
- Education and achievements.
- Contact section with email, GitHub, resume.

- [ ] **Step 2: Update CSS for the homepage**

Adjust existing CSS classes or add focused classes for:

- Compact technical hero.
- Two-column project cards on desktop and single-column layout on mobile.
- Skills grid.
- Education timeline.
- Clear buttons for resume, GitHub, and email.

- [ ] **Step 3: Run verification and confirm homepage still needs case page work**

Run:

```powershell
.\scripts\verify-site-content.ps1
```

Expected: FAIL only because `projects/mining-case.html` still has old product-oriented content.

- [ ] **Step 4: Commit homepage rewrite**

Run:

```powershell
git add index.html styles.css home.css
git commit -m "Rewrite homepage for software development internship"
```

## Task 3: Rewrite Mining Project Detail Page

**Files:**
- Modify: `projects/mining-case.html`
- Modify: `case.css`

- [ ] **Step 1: Replace product-case language with technical project language**

Rewrite the case page to include:

- Title: `矿业生产计划智能优化技术项目 | 王敬博`
- Header links back to homepage, project overview, workflow, modules, results, resume.
- Hero describing the project as a technical project.
- Background: dynamic market demand and static monthly production planning mismatch.
- Technical workflow: data processing, HMM state recognition, scenario generation, plan evaluation, result comparison.
- Responsibility section: Python modules, data processing, method implementation, result validation, documentation.
- Results: accepted patent, admitted paper, average comprehensive utility improvement, system module support.

- [ ] **Step 2: Update case CSS**

Adjust `case.css` for:

- Technical overview cards.
- Workflow steps.
- Module grid.
- Results list.
- Responsive mobile readability.

- [ ] **Step 3: Run verification and confirm it passes**

Run:

```powershell
.\scripts\verify-site-content.ps1
```

Expected: PASS with `Site content verification passed.`

- [ ] **Step 4: Commit case page rewrite**

Run:

```powershell
git add projects/mining-case.html case.css
git commit -m "Rewrite mining project as technical detail page"
```

## Task 4: Manual Static Site Verification

**Files:**
- No expected file changes unless defects are found.

- [ ] **Step 1: Start a local static server**

Run:

```powershell
python -m http.server 8000
```

Expected: server starts at `http://localhost:8000/`.

- [ ] **Step 2: Check homepage in browser**

Open:

```text
http://localhost:8000/
```

Verify:

- Hero clearly says software development intern, not product.
- Email, GitHub, and resume links are visible.
- Project cards are readable.
- The existing headshot appears.

- [ ] **Step 3: Check project page in browser**

Open:

```text
http://localhost:8000/projects/mining-case.html
```

Verify:

- Page reads as a technical project page.
- Workflow and module sections are readable.
- Navigation back to homepage works.

- [ ] **Step 4: Check forbidden wording with `rg`**

Run:

```powershell
rg "产品经理|产品作品集|Product Management|Product Manager|product manager|AI 产品|产业数字化产品"
```

Expected: no matches outside docs or Git history. If matches appear in live HTML/CSS/README, remove them.

- [ ] **Step 5: Commit any verification fixes**

If visual or link fixes were needed, run:

```powershell
git add index.html projects/mining-case.html styles.css home.css case.css README.md
git commit -m "Polish software developer site verification issues"
```

## Task 5: Publish

**Files:**
- No local file changes.

- [ ] **Step 1: Confirm clean working tree**

Run:

```powershell
git status --short
```

Expected: no output.

- [ ] **Step 2: Push to GitHub**

Run:

```powershell
git push origin main
```

Expected: push succeeds. If authentication fails, configure normal Git credentials or install GitHub CLI as a follow-up.

- [ ] **Step 3: Confirm remote URL**

Open:

```text
https://1046649659-cmyk.github.io
```

Expected: updated software developer homepage appears after GitHub Pages deploys.

## Self-Review

- Spec coverage: the plan covers homepage rewrite, mining project detail rewrite, product wording removal, public contact choices, existing headshot preservation, resume link, GitHub link, and local verification.
- Placeholder scan: no TBD, TODO, or "implement later" placeholders.
- Scope check: the plan keeps the site static and avoids adding new frameworks or unrelated redesign work.

