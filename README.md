# PAIMANA VANTAGE

> **SIH26103 · Disaster / Infrastructure Project Monitoring Intelligence Prototype**

PAIMANA VANTAGE is a **web-based integrated project-monitoring and disaster-intelligence command centre** designed around the PAIMANA use case. It turns a large project portfolio into an investigation workflow: portfolio overview → geographic monitoring → project dossier → historical trajectory → evidence and intervention audit.

The repository contains the complete **React + Vite frontend**, **FastAPI backend**, **SQLite analytical data layer**, source-report archive, and a Windows one-click startup flow for judges and reviewers.

## What the prototype demonstrates

- **National portfolio command centre** with current-snapshot KPIs and attention states.
- **Interactive portfolio map** for geographic exploration and regional context.
- **Project investigation dossier** with project identity, progress, commitments, cost movement, and historical trajectory.
- **Reference-class attention engine** using deterministic, transparent rules rather than an opaque production-probability model.
- **Historical monthly snapshots** from July 2025 through April 2026.
- **Evidence / provenance layer** tied to the bundled source-report archive.
- **Intervention workflow and audit trail** for turning monitoring signals into tracked actions.
- **Structured analyst interface** for querying the portfolio.
- **CSV export** for downstream analysis.

## Architecture

```text
React + Vite frontend
        │
        ▼
FastAPI REST API (/api/v3)
        │
        ├── deterministic monitoring / attention engine
        ├── historical trajectory calculations
        ├── project + portfolio services
        ├── evidence / provenance responses
        └── intervention audit trail
        │
        ▼
SQLite data layer
        └── monthly project snapshots + source registry
```

The frontend is a client of the backend; business logic and persisted data remain backend-authoritative.

## Repository layout

```text
PAIMANA-VANTAGE/
├── frontend/              # React + TypeScript + Vite UI
├── backend/               # FastAPI API + data/analytical services
│   └── data/              # Bundled SQLite database + source reports
├── docs/                  # Design, validation, release and handoff notes
├── scripts/               # Startup, readiness and smoke-test helpers
├── START_VANTAGE.bat      # One-click Windows startup
└── STOP_VANTAGE.bat       # One-click Windows shutdown
```

## Run locally — Windows

### One-click route

Double-click:

```text
START_VANTAGE.bat
```

It prepares the backend environment, installs missing dependencies, starts the API and Vite frontend, performs readiness checks, runs the smoke test, and opens the dashboard.

To stop the services:

```text
STOP_VANTAGE.bat
```

### Manual route

Backend:

```powershell
cd backend
python -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
uvicorn app.api:app --host 127.0.0.1 --port 8000
```

Frontend, in a second terminal:

```powershell
cd frontend
npm install
npm run dev
```

The frontend expects the API at:

```text
http://127.0.0.1:8000/api/v3
```

See the `.env.example` files for configuration overrides.

## Data and assessment semantics

The bundled prototype is **frozen to the April 2026 reporting snapshot** while retaining historical monthly records for trajectory analysis. Observed source values are intentionally separated from derived monitoring signals.

The attention layer is a **deterministic analytical aid**. It is not presented as a calibrated probability of project failure, a government classification, or a replacement for official project review.

## Source evidence

The repository includes the source-report archive used to populate the bundled assessment data. This lets the prototype expose the evidence chain instead of presenting dashboard numbers without provenance.

## SIH demo flow

For a fast judging walkthrough, use the in-app **Demo path**:

```text
Overview → Map → Project → National Brief
```

The route uses the same loaded data layer as the normal application rather than a separate fake demo dataset.

## Tech stack

**Frontend:** React 18, TypeScript, Vite, Leaflet, Recharts, Lucide React

**Backend:** FastAPI, Uvicorn, Pydantic, SQLite, Python

**Data / evidence:** bundled monthly project snapshots + source PDFs

## Status

**Prototype / SIH submission build · April 2026 active snapshot · VANTAGE release 12**

Built for demonstration, evaluation, and further extension into a production-grade project-monitoring platform.
