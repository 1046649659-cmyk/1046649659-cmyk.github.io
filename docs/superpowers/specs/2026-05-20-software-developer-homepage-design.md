# Wang Jingbo Software Developer Homepage Design

## Goal

Update `1046649659-cmyk.github.io` from a product-manager portfolio into a software developer internship homepage for Wang Jingbo.

The public page should support resume delivery by giving recruiters a concise, credible view of Wang Jingbo's software development direction, Python foundation, technical projects, education, and contact paths.

## Confirmed Direction

- Target role: general software development intern, with Python as the main language.
- Public contact methods: email, GitHub profile, and downloadable resume PDF.
- Phone number stays only in the PDF resume, not on the public webpage.
- Existing homepage headshot remains unchanged.
- Product-manager positioning must be removed completely.
- No product portfolio, product manager, AI product, or industrial digital product wording should remain.

## Site Structure

The site remains a simple static GitHub Pages site with no build step.

- `index.html`: main personal homepage.
- `projects/mining-case.html`: technical project detail page for the mining production planning optimization project.
- `Resume.pdf`: downloadable resume.
- `assets/images/headshot.jpg`: existing profile photo.
- Existing CSS files may be revised to fit the software-developer homepage tone.

## Homepage Content

### Hero

The hero should present:

- Wang Jingbo / 王敬博.
- Master's student in Control Science and Engineering at Northeastern University.
- Target role: general software development intern / Python.
- Short summary emphasizing Python, data processing, optimization modeling, and engineering fundamentals.
- Actions for resume download, GitHub profile, and email contact.

### About

The about section should describe:

- Academic background in Industrial Intelligence and Control Science.
- Practical interest in turning data, algorithms, and system logic into usable software modules.
- Current development focus: Python programming, data processing, debugging, modular implementation, and software engineering basics.

### Projects

Show technical projects instead of product cases.

Primary projects:

1. Mining production-chain and industrial-chain intelligent collaboration and optimization research.
   - Python-based data processing.
   - HMM state recognition.
   - Scenario generation.
   - Comprehensive evaluation and plan comparison.
   - Intelligent optimization method and system.

2. Steel production planning intelligent optimization research.
   - Multi-objective combinatorial optimization model.
   - LS-MOEA/D implementation.
   - Encoding, decoding, crossover, mutation, repair, and local search.
   - Experimental analysis and reproducible result records.

### Internship

Keep the BMW Brilliance internship, but describe it from an engineering and data perspective:

- GEN6 battery production process introduction support.
- Process documentation and traceability.
- Production parameter visualization with Power BI.
- Data cleaning, metric display, and abnormal trend observation.
- Understanding of equipment parameters and software data flow.

### Skills

Skills should be grouped for software development recruiting:

- Python: syntax, functions, modules, files, data processing, debugging.
- Data structures and algorithms: arrays, linked lists, stacks, queues, trees, hash tables, sorting, searching, complexity basics.
- Engineering practice: SQL, Git, unit testing, local builds, issue diagnosis, documentation.
- Network basics: TCP/IP, HTTP, Socket communication, layered network model.
- Other languages/tools: Matlab and C basics, Power BI where relevant.

### Education And Achievements

Include:

- Northeastern University master's degree, Control Science and Engineering, 2024.09 to present.
- Northeastern University bachelor's degree, Industrial Intelligence, GPA 3.83/5.0, rank 6/64, 2020.09 to 2024.06.
- Patent, paper, competition, and scholarship highlights from the resume.

## Visual Tone

The page should be professional, restrained, and easy to scan. It should feel closer to a technical resume homepage than a marketing landing page.

Keep a clean layout similar in spirit to the referenced personal academic homepage, but adapt it for software development recruiting:

- Clear sections.
- Compact project cards.
- Technical keywords visible.
- No exaggerated hero marketing copy.
- No product-manager portfolio language.

## Project Detail Page

`projects/mining-case.html` should become a technical project detail page.

It should explain:

- Project background.
- Technical problem.
- Main workflow.
- Wang Jingbo's responsibilities.
- Python modules and algorithmic components.
- Results and research outputs.

It should not describe the project as a product manager case study.

## Verification

Before completion:

- Check that no product-manager related wording remains.
- Open the static site locally or run a simple static server to inspect the homepage.
- Verify links to `Resume.pdf`, GitHub, email, and the project detail page.
- Check mobile and desktop layout at a basic level.

