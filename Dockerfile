# Backend build stage
FROM node:18 as backend-builder
COPY --from=frontend-build /app/vitereact/dist/* /app/backend/public/