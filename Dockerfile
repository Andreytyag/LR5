# Simple integration web service
FROM node:18-alpine
WORKDIR /app

COPY app/package*.json ./
RUN npm install --production

COPY app/ ./

ENV PORT=3000
EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:3000/health || exit 1

CMD ["npm", "start"]
