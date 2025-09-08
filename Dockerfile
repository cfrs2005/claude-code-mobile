FROM node:20-alpine

WORKDIR /workspace

# Install required packages
RUN apk add --no-cache bash curl expect

# Install claude-code
#RUN curl -fsSL https://claude.ai/install.sh | bash
RUN npm install -g @anthropic-ai/claude-code

# Install happy-coder  
RUN npm install -g happy-coder

# Copy entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]