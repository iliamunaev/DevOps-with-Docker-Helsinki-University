
Originally, http://localhost:8080 directly points to the backend service’s port.
``` dockerfile
# frontend.Dockerfile
ENV REACT_APP_BACKEND_URL=http://localhost:8080
```

By changing the URL to http://localhost/api, I decouple the frontend from the backend's specific port 
and rely on Nginx to route /api paths to whatever service handles the backend logic.

```dockerfile
# frontend.Dockerfile
ENV REACT_APP_BACKEND_URL=http://localhost/api
```

