# AG Daily Briefing

Single-file app: everything lives in `index.html` (HTML, CSS, JS). Deployed via GitHub Pages from `main`.

## Releasing a change

Bump `<meta name="app-version" content="...">` in `index.html` on every change that gets pushed
(format `YYYY-MM-DD.N`). Open copies of the app (including the iPhone/iPad home-screen app) compare
this value against the live page and show a "New version available · Reload" banner when it differs.
If the version isn't bumped, users won't be prompted to reload.
