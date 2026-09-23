# fullstackopen-part11-app

Bloglist application with a CI/CD pipeline.


## CI/CD pipeline

`.github/workflows/pipeline.yml` runs on every pull request and on every push to
the main branch. Workflow lints, tests, builds and runs the end-to-end tests. Pushes to
the main branch are additionally deployed to Fly.io and tagged with a new version
number. A commit message containing `#skip` prevents the deployment and the
tagging. GitHub notifies by email if a workflow run fails.

`.github/workflows/health_check.yml` pings the deployed application once a day.


## Environment variables

The backend needs the variables listed in `server/.env.example`. Create
`server/.env` based on it for local development.

## Commands

Run in the repository root:

| Command | Description |
|---|---|
| `npm run install:all` | install dependencies for all three projects |
| `npm run dev` | start backend and frontend in development mode |
| `npm run lint` | lint both client and server |
| `npm test` | run client and server unit tests |
| `npm run test:e2e` | run Playwright tests (starts the servers automatically) |
| `npm run build` | build the production version of the frontend |
| `npm start` | start the backend in production mode |

The unit tests and the end-to-end tests need a MongoDB instance. One can be
started with Docker:

    docker run -d --rm -p 27017:27017 --name bloglist-mongo mongo:7


