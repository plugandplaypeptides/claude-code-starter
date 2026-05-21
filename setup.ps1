$ErrorActionPreference = "Stop"

# $HOME can be unset in some non-interactive PS sessions; USERPROFILE is the Windows fallback.
$home_dir = if ($HOME) { $HOME } else { $env:USERPROFILE }
$claude_dir = Join-Path $home_dir ".claude"
$agents_dir = Join-Path $claude_dir "agents"
$base_url = "https://raw.githubusercontent.com/plugandplaypeptides/claude-code-starter/main"

$files = @(
    @{ Url = "$base_url/CLAUDE.md";                       Dest = (Join-Path $claude_dir "CLAUDE.md");                Protect = $true  },
    @{ Url = "$base_url/agents/explore.md";               Dest = (Join-Path $agents_dir "explore.md");               Protect = $false },
    @{ Url = "$base_url/agents/code-review.md";           Dest = (Join-Path $agents_dir "code-review.md");           Protect = $false },
    @{ Url = "$base_url/agents/build-me-an-agent.md";     Dest = (Join-Path $agents_dir "build-me-an-agent.md");     Protect = $false }
)

Write-Host "Installing Claude Code Starter Kit..."

if (-not (Test-Path $agents_dir)) { New-Item -ItemType Directory -Path $agents_dir -Force | Out-Null }

$placed = @()
foreach ($f in $files) {
    $resp = Invoke-WebRequest -Uri $f.Url -UseBasicParsing
    $new_content = $resp.Content
    $dest = $f.Dest

    if (Test-Path $dest) {
        $existing = Get-Content -Raw -Path $dest
        if ($existing -eq $new_content) {
            Write-Host "  = $dest (unchanged, skipping)"
            continue
        }
        if ($f.Protect) {
            # CLAUDE.md is user-owned config; never clobber. Side-load as .starter so they can diff.
            $side = "$dest.starter"
            Set-Content -Path $side -Value $new_content -NoNewline
            Write-Host "  ! $dest exists with different content. Wrote new copy to $side instead."
            $placed += $side
            continue
        }
        Write-Host "  ! Overwriting existing $dest"
    }

    Set-Content -Path $dest -Value $new_content -NoNewline
    Write-Host "  + $dest"
    $placed += $dest
}

Write-Host ""
Write-Host "Done. Files placed:"
foreach ($p in $placed) { Write-Host "  $p" }
Write-Host ""
Write-Host "Next: cd to a folder and run claude"
