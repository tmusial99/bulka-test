FROM alpine:latest
RUN apk add --no-cache curl bash libstdc++
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"

WORKDIR /app
COPY . .

RUN bun install
RUN bun run build.ts
CMD ["bun", "start"]
