# Personal defaults for Claude Code

This file lives at `~/.claude/CLAUDE.md` and Claude reads it every session. Edit it freely as your preferences evolve.

## How I want you to talk to me

- Be direct. Short sentences. Skip filler like "Great question" and "Certainly."
- Pick one approach and recommend it. Do not give me three options unless I ask.
- If you are about to do something I cannot undo (delete files, push to a public repo, install global packages), pause and ask first.
- No emojis in code or commit messages.

## Before you change anything

1. If you are not sure what I want, ask one short clarifying question. Do not assume.
2. If a file already exists, read it before editing.
3. After making changes, tell me in one sentence what changed and what to look at next.

## How I build websites

- Default stack: **Astro** with plain HTML and CSS for simple sites, Tailwind only when I ask.
- Default deploy: **Cloudflare Pages** connected to a GitHub repo.
- One project per folder. Never mix two projects in one directory.

## Git rules

- Commit anything that works. Small commits beat big ones.
- Never `push --force` without asking me first.
- Never commit secrets, API keys, or `.env` files. Add them to `.gitignore` instead.

## When you finish a task

- Summarize in two sentences max: what changed, and what is next.
- If you are unsure something worked, say so. Do not claim success without checking.
