[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
$ErrorActionPreference = "Stop"

# $HOME can be unset in some non-interactive PS sessions; USERPROFILE is the Windows fallback.
$home_dir = if ($HOME) { $HOME } else { $env:USERPROFILE }
$claude_dir = Join-Path $home_dir ".claude"
$agents_dir = Join-Path $claude_dir "agents"
$base_url = "https://raw.githubusercontent.com/plugandplaypeptides/claude-code-starter/main"

$files = @(
    @{ Url = "$base_url/CLAUDE.md";                   Dest = (Join-Path $claude_dir "CLAUDE.md")               },
    @{ Url = "$base_url/agents/explore.md";           Dest = (Join-Path $agents_dir "explore.md")              },
    @{ Url = "$base_url/agents/code-review.md";       Dest = (Join-Path $agents_dir "code-review.md")          },
    @{ Url = "$base_url/agents/build-me-an-agent.md"; Dest = (Join-Path $agents_dir "build-me-an-agent.md")    }
)

Write-Host "Updating Claude Code Starter Kit..."
Write-Host "This will overwrite your local files with the latest from GitHub."
Write-Host ""

if (-not (Test-Path $agents_dir)) { New-Item -ItemType Directory -Path $agents_dir -Force | Out-Null }

$placed = @()
foreach ($f in $files) {
    $resp = Invoke-WebRequest -Uri $f.Url -UseBasicParsing
    $new_content = $resp.Content
    $dest = $f.Dest

    Set-Content -Path $dest -Value $new_content -NoNewline -Encoding UTF8
    Write-Host "  ~ overwrote $dest"
    $placed += $dest
}

Write-Host ""
Write-Host "Files updated:"
foreach ($p in $placed) { Write-Host "  $p" }
Write-Host ""
Write-Host "Done. If Claude is running, type /exit and start it again to load the new config."
