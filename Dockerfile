# Simple nginx image that serves a single index.html file
FROM nginx:alpine

# Remove the default nginx html
RUN rm -rf /usr/share/nginx/html/*

# Copy our index.html into the web root
COPY index.html /usr/share/nginx/html/index.html
COPY pic.png /usr/share/nginx/html/pic.png

# Copy custom nginx site config
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx (nginx in foreground is default in base image)
CMD ["nginx", "-g", "daemon off;"]
