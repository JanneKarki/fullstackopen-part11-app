FROM node:22-slim AS build

WORKDIR /app/client
COPY client/package.json client/package-lock.json ./
RUN npm ci
COPY client/ ./
RUN npm run build


FROM node:22-slim

ENV NODE_ENV=production

WORKDIR /app/server
COPY server/package.json server/package-lock.json ./
RUN npm ci --omit=dev
COPY server/ ./
COPY --from=build /app/client/dist /app/client/dist

EXPOSE 3003
CMD ["node", "index.js"]
