FROM registry.access.redhat.com/ubi9/nodejs-16-minimal@sha256:968b55e8b59b674b2bfee2b6eaaab773278a7695913dbef97043716b58fd2e4d

USER root

# Create and change to the app directory.
WORKDIR /opt/app-root

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Copy local code to the container image.
COPY . ./

USER 1001

# Run the web service on container startup.
CMD [ "npm", "start" ]
