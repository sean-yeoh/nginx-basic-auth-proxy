# nginx-basic-auth-proxy

Simple nginx reverse proxy with basic authentication, configured via environment variables.

## Usage

```bash
docker run -d \
  -p 8080:80 \
  -e BASIC_AUTH_USERNAME=admin \
  -e BASIC_AUTH_PASSWORD=secret \
  -e PROXY_PASS=http://your-backend:3000 \
  ghcr.io/sean-yeoh/nginx-basic-auth-proxy
```

## Environment Variables

| Variable              | Required | Default | Description             |
| --------------------- | -------- | ------- | ----------------------- |
| `BASIC_AUTH_USERNAME` | Yes      | -       | Basic auth username     |
| `BASIC_AUTH_PASSWORD` | Yes      | -       | Basic auth password     |
| `PROXY_PASS`          | Yes      | -       | Backend URL to proxy to |
| `PORT`                | No       | `80`    | Port to listen on       |
