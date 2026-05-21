# Claude Code Starter Kit

A zero-to-deployed setup for someone brand new to Claude Code on Windows. After you finish this README, you will be able to build websites and small web apps by typing what you want into Claude Code.

You do not need to be a coder. You do need a Windows PC, internet, and about 30 minutes.

---

## What you are getting

This repo gives you a small "starter brain" for Claude Code:

- A global config file (`CLAUDE.md`) that tells Claude how you want it to behave on your machine.
- Three subagents in `agents/`. A subagent is a focused helper Claude can hand work off to. Think of them as small employees who only know one job each.
  - **explore** — reads code and explains it. Cannot change anything.
  - **code-review** — checks finished work for bugs and security problems.
  - **build-me-an-agent** — creates a new subagent for you when you describe a new helper you want.

That last one is the important one. Once it is installed, you grow your own toolkit just by asking Claude.

---

## Part 1: Install Claude Code (5 minutes)

### 1. Make a Claude account

Go to **https://claude.ai** and sign up. The free plan works to start. Pro or Max gives you more usage.

### 2. Open PowerShell

Press the Windows key, type `powershell`, click **Windows PowerShell**.

### 3. Install Claude Code

Paste this into PowerShell and press Enter:

```
irm https://claude.ai/install.ps1 | iex
```

Wait about 30 seconds.

### 4. Confirm it works

Type:

```
claude --version
```

You should see a version number. If you see "not recognized," close PowerShell and open it again.

---

## Part 2: Install Git (5 minutes)

You need Git to push websites to GitHub so they can deploy.

1. Go to **https://git-scm.com/downloads/win**
2. Download and run the installer.
3. Click **Next** through every screen. The defaults are fine.
4. After it finishes, close PowerShell and open it again.
5. Test: type `git --version` and press Enter. You should see a version number.

Tell Git who you are. In PowerShell:

```
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

Use the same email you used for your GitHub account.

If you do not have a GitHub account yet, go to **https://github.com** and sign up. It is free.

---

## Part 3: Install this starter kit (3 minutes)

### Option A: Download as zip (easiest)

1. On this GitHub page, click the green **Code** button.
2. Click **Download ZIP**.
3. Unzip it somewhere you can find.

### Option B: Clone with Git

In PowerShell:

```
cd Documents
git clone https://github.com/plugandplaypeptides/claude-code-starter.git
cd claude-code-starter
```

### Copy the files into place

The starter files need to live in a special folder called `.claude` in your user home. PowerShell can do this in two commands.

Open PowerShell in the folder where you unzipped or cloned this repo (right-click in the folder, choose **Open in Terminal**), then run:

```
New-Item -ItemType Directory -Force -Path "$HOME\.claude\agents"
Copy-Item -Force CLAUDE.md "$HOME\.claude\CLAUDE.md"
Copy-Item -Force agents\*.md "$HOME\.claude\agents\"
```

Done. Claude will pick these up the next time you run it.

---

## Part 4: Build your first website (10 minutes)

### 1. Make a folder for your site

In PowerShell:

```
cd $HOME\Documents
mkdir my-first-site
cd my-first-site
```

### 2. Start Claude

```
claude
```

The first time you run it, your browser opens for sign-in. Sign in with your Claude account and close the tab when it says you can.

### 3. Ask Claude to build

Type this exactly:

```
build me a simple personal landing page using Astro. plain HTML and CSS, no fancy frameworks. one page with my name, a short bio, and three links. set up the project from scratch.
```

Claude will install Astro, create files, and run the dev server. When it shows you a URL (something like `http://localhost:4321`), open it in your browser. You will see your site.

Want to change something? Just say it:

- *"make the background dark"*
- *"add a section for my photos"*
- *"change the heading font to something serif"*

---

## Part 5: Deploy your site to the internet (10 minutes, one time)

### 1. Push to GitHub

Ask Claude:

```
push this project to a new public GitHub repo called my-first-site
```

Claude will walk you through any sign-in prompts. The repo will appear at `https://github.com/your-username/my-first-site`.

### 2. Connect Cloudflare Pages

1. Go to **https://dash.cloudflare.com** and sign up. Free.
2. In the left menu click **Workers and Pages**.
3. Click **Create application**, then the **Pages** tab, then **Connect to Git**.
4. Authorize GitHub when prompted. Pick your `my-first-site` repo.
5. Framework preset: **Astro**. Leave the build settings as-is. Click **Save and Deploy**.

About a minute later you have a live URL like `my-first-site.pages.dev`. Every time you push a change to GitHub, it redeploys automatically.

---

## Part 6: Grow your toolkit

This is where it gets fun.

Whenever you find yourself wishing Claude had a special helper for something, ask the **build-me-an-agent** agent to make one. Example:

```
use the build-me-an-agent agent to create a helper called "blog-writer" that drafts blog posts in my voice. it should read past posts in a /posts folder for style reference, then write a new draft. read-only on past posts. can write new ones.
```

Claude will create the file in `~/.claude/agents/` and it will be available immediately.

Some helpers people end up wanting:

- **deploy-checker** — runs through a checklist before you push.
- **content-writer** — drafts marketing copy for your sites.
- **link-checker** — finds broken links on a site.
- **seo-helper** — adds meta tags and improves search visibility.

Just describe the helper you want. The meta-agent does the rest.

---

## When things break

- **"command not found"** — Close PowerShell and open it again. New installs need a fresh window.
- **Claude looks slow or stuck** — Press **Ctrl+C** to cancel, then try again.
- **You are not sure what to do next** — Just ask Claude. Type the problem in plain English and it will help.
- **Something is really broken** — Text the person who sent you this repo a screenshot.

---

## Rules of thumb

1. **Ask Claude in plain English.** No special syntax needed.
2. **Verify before destroying.** Claude will ask before deleting things. Read the question.
3. **Commit often.** After anything you like, ask Claude to commit and push. That saves your progress.
4. **One project per folder.** Do not mix projects in the same folder.
5. **The terminal is just a chat window.** Type, press Enter, read the reply. That is it.

Welcome to building with Claude Code.
