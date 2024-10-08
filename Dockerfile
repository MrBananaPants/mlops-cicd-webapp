# Use an optimized base image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock before the application code
# This allows Docker to cache the dependencies installation
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Now copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["yarn", "start"]
