# Claude Code Starter Kit

A zero-to-building setup for someone brand new to Claude Code on Windows. After about 10 minutes you will be talking to Claude in your terminal and asking it to build things for you.

You do not need to be a coder. You need a Windows PC, internet, and a Claude account.

---

## What you get

This repo gives Claude a small starter brain. One config file plus three helpers (called "subagents"):

- **explore**: reads code and explains it. Cannot change anything.
- **code-review**: checks finished work for bugs and security problems.
- **build-me-an-agent**: creates a new helper for you when you describe one. This is how you grow your toolkit over time.

---

## Install (3 commands)

### 1. Make a Claude account
Go to **https://claude.ai** and sign up. Free works to start.

### 2. Open PowerShell
Press the Windows key, type `powershell`, click **Windows PowerShell**.

### 3. Run these three commands, one at a time

**Install Claude Code:**
```
irm https://claude.ai/install.ps1 | iex
```

**Install this starter kit:**
```
irm https://raw.githubusercontent.com/plugandplaypeptides/claude-code-starter/main/setup.ps1 | iex
```

**Start Claude:**
```
claude
```

The first time you run `claude`, your browser opens for sign-in. Sign in and close the tab when it tells you to.

That is it. You are ready to build.

---

## Build your first thing (10 minutes)

### 1. Make a folder for your project

Every project lives in its own folder. You are about to make one called `my-first-site`.

In PowerShell, paste these three lines, one at a time:

```
cd ~
mkdir my-first-site
cd my-first-site
```

What just happened:
- `cd ~` moved you to your user home folder (the same folder File Explorer shows when you click your name in the left sidebar).
- `mkdir my-first-site` created a new folder there called `my-first-site`.
- `cd my-first-site` moved you into it. Anything Claude builds next will live in this folder.

You can open File Explorer any time and find this folder at `C:\Users\YOUR-USERNAME\my-first-site`.

### 2. Start Claude

```
claude
```

If you see "command not found," close PowerShell completely and open it again. The install needs a fresh window. Then come back to this folder with `cd ~\my-first-site` and try `claude` again.

### 3. Ask Claude to build

Once Claude is running, paste this:

```
build me a simple personal landing page. one page with my name, a short bio, and three links. plain HTML and CSS. set up the project from scratch in this folder.
```

Claude will create files and run the dev server. When it shows you a URL like `http://localhost:4321`, open it in your browser. You will see your site.

To change anything, just say it:

- *"make the background dark"*
- *"add a section for my photos"*
- *"the heading is too small, make it bigger"*

---

## Grow your toolkit

The most useful helper in this kit is `build-me-an-agent`. Whenever you wish Claude had a special assistant for something you do a lot, ask for one. Example:

```
use build-me-an-agent to create a helper called "blog-writer" that drafts blog posts in my voice. it should read past posts in a /posts folder for style reference, then write a new draft.
```

Claude creates the new helper file in your `~/.claude/agents/` folder. It is available the next time you start Claude.

Over time you build up a team of helpers shaped exactly to your work.

---

## Part 4 (later): Put your site on the internet

You do not need this on day one. When you have a site you like and want the world to see it, ask Claude:

```
help me put this site on the internet for free using GitHub and Cloudflare Pages
```

Claude will walk you through installing Git, making a GitHub account if needed, and connecting Cloudflare Pages. About 20 minutes the first time. After that, every change you make deploys automatically.

---

## When things break

- **"command not found"**: close PowerShell and open it again. New installs need a fresh window.
- **Claude looks stuck**: press Ctrl+C, then try again.
- **You are not sure what to do**: just ask Claude in plain English. It will help.
- **Really stuck**: text the person who sent you this with a screenshot.

---

## Rules of thumb

1. Ask Claude in plain English. No special syntax.
2. Read the question before answering "yes" to anything destructive.
3. After anything works, say "commit this." That saves your progress.
4. One project per folder.
5. The terminal is just a chat window. Type, press Enter, read the reply.

Welcome to building.
