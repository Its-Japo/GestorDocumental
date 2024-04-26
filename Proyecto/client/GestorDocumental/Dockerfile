# Use the official nginx image as a base
FROM nginx:alpine

# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
