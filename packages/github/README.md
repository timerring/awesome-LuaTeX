# GitHub Metrics Package

> Comprehensive GitHub repository metrics integration for LaTeX documents - fetch stars, forks, contributors, license, and more in real-time.

[![LuaTeX](https://img.shields.io/badge/LuaTeX-required-blue.svg)](http://www.luatex.org/)

## Overview

The **GitHub Metrics Package** is a comprehensive LuaTeX solution that dynamically fetches and displays GitHub repository data during document compilation. It provides 10 different metrics including stars, forks, watchers, contributors, open issues, license information, release versions, primary language, and creation dates.

Perfect for:
- **Technical Documentation**: Show live project statistics in your documentation
- **Academic Papers**: Reference open-source projects with current metrics
- **Portfolio & CV**: Display your GitHub repository achievements
- **Comparison Tables**: Compare multiple repositories side-by-side
- **Project Reports**: Include real-time project health indicators

All metrics are fetched automatically during compilation and formatted for optimal readability.

## Features

- **10 GitHub Metrics**: Stars, forks, watchers, contributors, issues, license, release, tag, language, and creation date
- **Real-time Data**: Automatically fetch current data during each compilation
- **No Rate Limits**: Uses shields.io API and GitHub API to bypass authentication requirements
- **Smart Formatting**: 
  - Numeric values with "k/m/b" suffixes get "+" (e.g., `240k+`, `50k+`)
  - Large numbers are abbreviated for readability
  - Text values are properly capitalized (e.g., `JavaScript`, `MIT`)
  - Dates formatted as `YYYY-MM-DD`
- **Cross-Platform**: Fully compatible with macOS and Linux
- **Simple API**: Intuitive `\getgithub<metric>{owner/repo}` command pattern
- **Flexible Loading**: Load all metrics at once or only what you need
- **No External Dependencies**: Uses built-in system commands (`curl`, `sed`, `grep`)
- **Batch Operations**: Efficient for comparing multiple repositories

## Files

```
packages/github/
├── README.md                   # This documentation
├── github-all.lua              # Load all metrics at once (recommended)
├── github-stars.lua            # Stars counter
├── github-contributors.lua     # Contributors counter
├── github-forks.lua            # Forks counter
├── github-watchers.lua         # Watchers counter
├── github-issues.lua           # Open issues counter
├── github-license.lua          # License information
├── github-release.lua          # Latest release version
├── github-tag.lua              # Latest tag
├── github-language.lua         # Primary programming language
└── github-created.lua          # Repository creation date
```

See [`../../example.tex`](../../example.tex) for complete usage examples in the project root.

## Quick Start

### 1. Installation

**Option A**: Copy all scripts to your project

```bash
cp packages/github/*.lua /path/to/your/project/
```

**Option B**: Copy specific scripts you need

```bash
cp packages/github/github-stars.lua /path/to/your/project/
cp packages/github/github-forks.lua /path/to/your/project/
```

**Option C**: Use relative path (if keeping project structure)

Keep the files in `packages/github/` and reference them relatively.

### 2. Basic Usage

In your LaTeX document:

**Option A: Load all metrics at once (Recommended)**

```latex
\documentclass{article}

\begin{document}

% Load all GitHub metrics
\directlua{dofile("packages/github/github-all.lua")}

% Use any command
The Linux kernel has \getgithubstars{torvalds/linux} stars,
\getgithubforks{torvalds/linux} forks,
and is licensed under \getgithublicense{torvalds/linux}.

\end{document}
```

**Option B: Load specific metrics**

```latex
\documentclass{article}

\begin{document}

% Load only the metrics you need
\directlua{dofile("packages/github/github-stars.lua")}
\directlua{dofile("packages/github/github-forks.lua")}
\directlua{dofile("packages/github/github-license.lua")}

% Use the commands
The Linux kernel has \getgithubstars{torvalds/linux} stars.

\end{document}
```

### 3. Compile

**Must use the `--shell-escape` option:**

```bash
lualatex --shell-escape your-document.tex
```

## Available Commands

| Command | Description | Example Output |
|---------|-------------|----------------|
| `\getgithubstars{owner/repo}` | Number of stars | `240k+`, `823` |
| `\getgithubforks{owner/repo}` | Number of forks | `50k+`, `411` |
| `\getgithubwatchers{owner/repo}` | Number of watchers | `6.7k+`, `156` |
| `\getgithubcontributors{owner/repo}` | Number of contributors | `1.2k+`, `411` |
| `\getgithubissues{owner/repo}` | Number of open issues | `823`, `42` |
| `\getgithublicense{owner/repo}` | License type | `MIT`, `Apache-2.0` |
| `\getgithubrelease{owner/repo}` | Latest release version | `v19.2.0` |
| `\getgithubtag{owner/repo}` | Latest tag | `v2.0.1` |
| `\getgithublanguage{owner/repo}` | Primary language | `JavaScript` |
| `\getgithubcreated{owner/repo}` | Creation date | `2013-05-24` |

## Usage Examples

### Example 1: Single Metric

```latex
\documentclass{article}
\begin{document}

\directlua{dofile("packages/github/github-stars.lua")}

React currently has \getgithubstars{facebook/react} stars on GitHub!

\end{document}
```

### Example 2: Multiple Metrics

```latex
\documentclass{article}
\begin{document}

% Load all metrics
\directlua{dofile("packages/github/github-stars.lua")}
\directlua{dofile("packages/github/github-forks.lua")}
\directlua{dofile("packages/github/github-license.lua")}
\directlua{dofile("packages/github/github-language.lua")}

\section{Vue.js Repository}

\begin{itemize}
    \item Stars: \getgithubstars{vuejs/vue}
    \item Forks: \getgithubforks{vuejs/vue}
    \item License: \getgithublicense{vuejs/vue}
    \item Language: \getgithublanguage{vuejs/vue}
\end{itemize}

\end{document}
```

### Example 3: Comparison Table

```latex
\begin{tabular}{|l|c|c|c|}
\hline
\textbf{Framework} & \textbf{Stars} & \textbf{Forks} & \textbf{Language} \\
\hline
React & \getgithubstars{facebook/react} & \getgithubforks{facebook/react} & \getgithublanguage{facebook/react} \\
\hline
Vue & \getgithubstars{vuejs/vue} & \getgithubforks{vuejs/vue} & \getgithublanguage{vuejs/vue} \\
\hline
Angular & \getgithubstars{angular/angular} & \getgithubforks{angular/angular} & \getgithublanguage{angular/angular} \\
\hline
\end{tabular}
```

### Example 4: Complete Repository Profile

```latex
% Load all scripts
\directlua{dofile("packages/github/github-stars.lua")}
\directlua{dofile("packages/github/github-forks.lua")}
\directlua{dofile("packages/github/github-contributors.lua")}
\directlua{dofile("packages/github/github-license.lua")}
\directlua{dofile("packages/github/github-language.lua")}
\directlua{dofile("packages/github/github-created.lua")}
\directlua{dofile("packages/github/github-release.lua")}

\section{TensorFlow}

\begin{description}
    \item[Stars:] \getgithubstars{tensorflow/tensorflow}
    \item[Forks:] \getgithubforks{tensorflow/tensorflow}
    \item[Contributors:] \getgithubcontributors{tensorflow/tensorflow}
    \item[License:] \getgithublicense{tensorflow/tensorflow}
    \item[Language:] \getgithublanguage{tensorflow/tensorflow}
    \item[Created:] \getgithubcreated{tensorflow/tensorflow}
    \item[Latest Release:] \getgithubrelease{tensorflow/tensorflow}
\end{description}
```

## Output Format

The package intelligently formats different metric types for optimal readability:

### Numeric Metrics (Stars, Forks, Watchers, Contributors, Issues)

| shields.io Returns | Displayed As | Rule |
|-------------------|--------------|------|
| `240k` | `240k+` | Numbers with k/m/b suffix get "+" added |
| `15.3k` | `15.3k+` | Decimal values with suffix get "+" |
| `6.7k` | `6.7k+` | All abbreviated numbers get "+" |
| `823` | `823` | Pure numbers remain as-is |
| `411` | `411` | No suffix means exact count |

**The "+" indicates "at least this many"** since these metrics grow over time.

### Text Metrics

| Metric | Format | Example Output |
|--------|--------|----------------|
| **License** | Exact license name | `MIT`, `Apache-2.0`, `GPL-3.0` |
| **Language** | Capitalized language | `JavaScript`, `TypeScript`, `Python` |
| **Release** | Version tag | `v19.2.0`, `1.0.0` |
| **Tag** | Latest tag | `v2.0.1`, `beta-3` |
| **Created Date** | YYYY-MM-DD format | `2013-05-24`, `2015-04-10` |

## How It Works

The package uses an efficient approach to fetch GitHub metrics without authentication or rate limits:

### For Numeric Metrics (Stars, Forks, Watchers, Contributors, Issues)

1. **API Call**: Uses `curl` to fetch from shields.io API
   ```
   https://img.shields.io/github/<metric>/{owner}/{repo}?style=flat
   ```

2. **Parse SVG Response**: Extracts data using `grep` and `sed`
   ```bash
   grep -oE ">[0-9.kmb]+<" | sed "s/[><]//g" | head -1
   ```

3. **Format in Lua**: Adds "+" suffix to abbreviated numbers (e.g., `240k` → `240k+`)

4. **Output**: Prints formatted result via `tex.print()`

### For Text Metrics (License, Language, Release, Tag)

1. **API Call**: Fetches from shields.io API or GitHub API
2. **Parse Response**: Extracts text values using pattern matching
3. **Capitalize**: Applies proper capitalization for common values
4. **Output**: Returns formatted text string

### For Date Metrics (Creation Date)

1. **API Call**: Calls GitHub REST API directly
2. **Parse JSON**: Extracts creation date from JSON response
3. **Format**: Converts to YYYY-MM-DD format
4. **Output**: Returns formatted date string

## Technical Details

### Dependencies

- **LuaTeX** (version 0.95 or later)
- **curl** - For making HTTP requests (built-in on macOS/Linux)
- **sed** - For parsing SVG response (built-in on macOS/Linux)
- **Internet connection** - Required for fetching data

### System Requirements

- **macOS**: Fully supported
- **Linux**: Fully supported
- **Windows**: May require WSL or Cygwin (not tested)

### Command Structure

All commands follow the same pattern:

```latex
\getgithub<metric>{owner/repo}
```

**Parameters:**
- **owner**: GitHub repository owner/organization
- **repo**: Repository name

**Returns:** Metric value as formatted string

**Example:**
```latex
\getgithubstars{torvalds/linux}      % Returns: "150k+"
\getgithubforks{vuejs/vue}           % Returns: "34k+"
\getgithublicense{facebook/react}    % Returns: "MIT"
\getgithublanguage{torvalds/linux}   % Returns: "C"
\getgithubcreated{facebook/react}    % Returns: "2013-05-24"
```

## Important Notes

### Security Warning

**Critical**: This package requires the `--shell-escape` flag, which allows LaTeX to execute system commands.

```bash
lualatex --shell-escape your-document.tex
```

**Security Implications**:
- Allows execution of arbitrary shell commands
- **Only use with documents you trust**
- Malicious documents could potentially harm your system
- Never compile untrusted `.tex` files with `--shell-escape`

---

**[← Back to Main README](../../README.md)**

