# Deploy options for AI-Forge

Options:
- Deploy to Render / Fly / Heroku / Vercel (Node 22+ supported). Use a `Dockerfile` if native binaries are needed.
- For local-first offline engines, use a small VM or container with process manager (systemd, PM2) and expose only the required ports behind a reverse proxy.

If you want a Cloudflare front door, deploy the Node service elsewhere, then route requests through Cloudflare Workers or a reverse-proxy for the single-domain experience.
