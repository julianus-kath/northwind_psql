# Railway Deployment (northwind-db)

Deploy this repository as a private Railway service to provide Postgres + Northwind seed data.

## What this image does

- Uses `postgres:16`
- Loads `northwind.sql` from `/docker-entrypoint-initdb.d/001-northwind.sql`
- Executes seed only on first database initialization

## Railway service setup

1. Create service from this repo.
2. Builder: Dockerfile (root `Dockerfile`).
3. Add Railway volume at `/var/lib/postgresql/data`.
4. Set variables:
   - `POSTGRES_DB=northwind`
   - `POSTGRES_USER=postgres`
   - `POSTGRES_PASSWORD=<strong-random-password>`
5. Keep this service private (no public domain).

## Internal connection values for consumers

- Host: `northwind-db.railway.internal` (or service-private hostname shown by Railway)
- Port: `5432`
- Database: `northwind`
- User: `postgres`
- Password: value from `POSTGRES_PASSWORD`

## Re-seeding notes

- Seed runs only when data directory is empty.
- To re-seed from scratch, remove/reset the Railway volume and redeploy.
