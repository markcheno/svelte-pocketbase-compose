# svelt-pocketbase-project

Forked from (https://gitlab.com/johnmarianhoffman/svelte-pocketbase-compose)

This is an empty, ready-to-deploy* stack that uses [PocketBase](https://github.com/pocketbase) as the backend, and [Svelte](https://github.com/sveltejs/svelte) for the frontend.

Goals:
- easy to build 
- easy to deploy
- simple (no complex server architecture, not worried about any fancy horizontal scaling, easy DB management via WebUI)
- powerful (Bare bones Svelte => highly customizable, sophisticated js framework.)

## Getting started

Prerequisites: Make, [Node.js/NPM](https://nodejs.org/en/download)

Note: Make is not strictly required if you don't have access.  I'm just using it to alias repetitive commands.

Run locally:

```bash
git clone https://gitlab.com/johnmarianhoffman/svelte-pocketbase-compose.git
cd svelt-pocketbase-compose
make build
APP_HOST=localhost APP_PORT=8181 make run
```

Key paths are (change host/port as needed):

```
Svelte index:           http://localhost:8181/
PocketBase admin panel: http://localhost:8181/_/
PocketBase API:         http://localhost:8181/api/
```

Deploy (NOT TESTED, but this is the intended workflow):

```bash
make build
make deploy
```

## Some setup notes:

SvelteKit is configured to build a static site.

Both PB and Svelte mount their required state files (database, compiled static HTML+JS) from the host.  All changes to the live DB are saved to the host (`backend/pb_data/*`), and Svelte files (`frontend/media/*`) can be rebuilt on the host and viewed "live" without having to stop/restart the Docker containers.  If you wanted to back up the full, current state, you just need to back up these two directories (and technically only `backend/pb_data`)

* do your own homework and decide what's "secure enough" for your use case. I make no guarantees and am not responsible for anything. See the license.

## Issues
Please let me know if you run into any issues with this or have any thoughts about making it better.
