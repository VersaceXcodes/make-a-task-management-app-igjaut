# Frontend build stage
FROM node:18 AS frontend-build
WORKDIR /app
COPY vitereact/package*.json vitereact/
RUN cd vitereact && npm install
COPY vitereact/ vitereact/
RUN cd vitereact && npm run build

# Backend build stage
FROM node:18 AS backend-build
WORKDIR /app
COPY backend/package*.json backend/
RUN cd backend && npm install
COPY backend/ backend/
RUN mkdir -p backend/public
COPY --from=frontend-build /app/vitereact/dist/* backend/public/
CMD ["node", "backend/server.js"]