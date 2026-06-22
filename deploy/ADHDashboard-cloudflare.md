# Deploying ADHDashboard to Cloudflare Pages

1. Create a Cloudflare Pages site.
2. Connect to the `ADHDashboard-git` repo and set the build output directory to the repo root (it's a static site that serves `index.html`).
3. Configure a production branch and set `index.html` as entrypoint.

Example: no build command required; set build output to `/` and production branch to `main`.
