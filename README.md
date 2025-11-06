# Awesome LuaTeX

> A curated collection of powerful LuaTeX functions and packages for creating dynamic, data-driven LaTeX documents.

[![LuaTeX](https://img.shields.io/badge/LuaTeX-required-blue.svg)](http://www.luatex.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## About

**Awesome LuaTeX** combines the typesetting power of TeX with the flexibility of the Lua programming language, enabling you to create interactive documents with real-time data fetching, dynamic content generation, and powerful automation.

## Packages

### GitHub

Utilities for integrating GitHub data into your LaTeX documents.

**Location**: [`packages/github/`](packages/github/)

**Features**:
- 11 different GitHub metrics (repository stars, user total stars, forks, etc.)
- Real-time data fetching during compilation
- Uses shields.io API (bypasses GitHub API rate limits)
- Smart formatting for numeric values
- Compatible with macOS and Linux
- Simple one-line commands

#### Available Metrics

| Metric | Command | Description |
|--------|---------|-------------|
| **Repository Stars** | `\getgithubrepostars{repo}` | Repository star count |
| **User Total Stars** | `\getgithubuserstars{username}` | User's total stars across all repos |
| **Forks** | `\getgithubforks{repo}` | Number of forks |
| **Watchers** | `\getgithubwatchers{repo}` | Number of watchers |
| **Contributors** | `\getgithubcontributors{repo}` | Number of contributors |
| **Issues** | `\getgithubissues{repo}` | Open issues count |
| **License** | `\getgithublicense{repo}` | Repository license |
| **Release** | `\getgithubrelease{repo}` | Latest release version |
| **Tag** | `\getgithubtag{repo}` | Latest tag |
| **Language** | `\getgithublanguage{repo}` | Primary language |
| **Created** | `\getgithubcreated{repo}` | Creation date |

**Quick Example**:
```latex
\documentclass{article}
\begin{document}

% Load all GitHub metrics at once (recommended)
\directlua{dofile("packages/github/github-all.lua")}

% Use any command
The Linux kernel has \getgithubrepostars{torvalds/linux} stars,
\getgithubforks{torvalds/linux} forks,
and is licensed under \getgithublicense{torvalds/linux}.
Linus Torvalds has \getgithubuserstars{torvalds} total stars.

\end{document}
```

**Compile with**:
```bash
lualatex --shell-escape your-document.tex
```

[**Full Documentation →**](packages/github/README.md)

---

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/awesome-LuaTeX.git
cd awesome-LuaTeX
```

### 2. Try the Example

Compile the example document to see all packages in action:

```bash
lualatex --shell-escape example.tex
```

This will generate `example.pdf` with complete documentation and live examples.

### 3. Use in Your Project

Copy the package you need to your project:

```bash
cp -r packages/github /path/to/your/project/
```

Then load it in your `.tex` file:

```latex
\directlua{dofile("packages/github/github-repo-stars.lua")}
\directlua{dofile("packages/github/github-user-stars.lua")}
```

## Documentation

- **[example.tex](example.tex)** - Complete examples and documentation in LaTeX format
- **[example.pdf](example.pdf)** - Compiled documentation (generated after compilation)
- Each package directory contains a detailed README with usage instructions

### Package Documentation

| Package | Description | Documentation |
|---------|-------------|---------------|
| **GitHub Metrics** | Fetch GitHub data (11 metrics: repository stars, user total stars, forks, license, etc.) | [README](packages/github/README.md) |

## Requirements

- **LuaTeX** (version 0.95 or later recommended)
- **System commands** (for packages requiring network access):
  - `curl` (built-in on macOS/Linux)
  - `sed` (built-in on macOS/Linux)
- **Internet connection** (for real-time data fetching)

## Security Notice

**Important**: Some packages require the `--shell-escape` option to execute external system commands.

```bash
lualatex --shell-escape your-document.tex
```

**Security Warning**: The `--shell-escape` flag allows LaTeX to execute system commands. **Only use this option with documents you trust**. Malicious documents could potentially harm your system.

## Project Structure

```
awesome-LuaTeX/
├── README.md              # This file
├── example.tex            # Complete examples and documentation
├── example.pdf            # Compiled documentation
├── LICENSE                # License file
└── packages/              # Package directory
    └── github/            # GitHub integration packages
        ├── README.md                # GitHub packages documentation
        ├── github-all.lua           # Load all metrics (recommended)
        ├── github-repo-stars.lua    # Repository stars counter
        ├── github-user-stars.lua    # User total stars counter
        ├── github-forks.lua         # Forks counter
        ├── github-watchers.lua      # Watchers counter
        ├── github-contributors.lua  # Contributors counter
        ├── github-issues.lua        # Issues counter
        ├── github-license.lua       # License fetcher
        ├── github-release.lua       # Release version fetcher
        ├── github-tag.lua           # Tag fetcher
        ├── github-language.lua      # Language detector
        └── github-created.lua       # Creation date fetcher
```

## Contributing

Contributions are welcome! Here's how you can help:

1. **Add new packages**: Create a new directory under `packages/` with your Lua scripts
2. **Improve documentation**: Enhance README files or add examples
3. **Report issues**: Found a bug? [Open an issue](https://github.com/yourusername/awesome-LuaTeX/issues)
4. **Submit pull requests**: Fork, modify, and submit a PR

### Guidelines

- Each package should have its own directory with a README
- Include usage examples in `example.tex`
- Document any dependencies and system requirements
- Add security warnings for packages requiring `--shell-escape`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- The LuaTeX development team
- shields.io for providing the GitHub API proxy
- All contributors to this project

## Contact

- **Author**: timerring
- **Issues**: [GitHub Issues](https://github.com/timerring/awesome-LuaTeX/issues)
