## Docker Optimization
### Before optimization: 
Initial base for image - python:latest

### After optimization: 
Base for image - python:3.12-alpine  
Multi-stage build using python:3.12-slim 

### Image sizes:
```text
REPOSITORY           TAG       IMAGE ID       CREATED          SIZE
myapp-optimized      latest    20cfd8d2ea8b   2 minutes ago    130MB
myapp-notoptimized   latest    0b76a62598cb   17 minutes ago   1.02GB
```
