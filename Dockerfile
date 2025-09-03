FROM node:20-alpine

WORKDIR /app

# Install required packages
RUN apk add --no-cache bash curl expect

# Install claude-code
RUN curl -fsSL https://claude.ai/install.sh | bash

# Install happy-coder  
RUN npm install -g happy-coder

# Copy entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]