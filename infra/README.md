# Infrastructure

This directory contains infrastructure definitions for CI/CD and deployment.

- `Dockerfile.build`: Build container image definition.
- `docker-compose.build.yml`: Local/CI build orchestration.
- `vercel.json`: Vercel deployment/build configuration.

Note: GitHub Actions workflows remain in `.github/workflows/` because GitHub requires that location.
