# Grafana on Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/5QsVtM)

Deploy **Grafana OSS** to [Railway](https://railway.app) with one click. PostgreSQL auto-provisioned — dashboards, data sources, and alerts persist across every redeploy.

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://buymeacoffee.com/yzha)

## Features

| Feature | Description |
|---------|-------------|
| **Latest Grafana** | Always deploys the latest stable OSS version |
| **PostgreSQL Auto-Provisioned** | Database created automatically on deploy |
| **Zero Config** | `DATABASE_URL` wired automatically between services |
| **Health Check** | Built-in container and Railway health monitoring |
| **Plugin Support** | Install any Grafana plugin via environment variable |

## One-Click Deploy

Click the **Deploy on Railway** button above. Both Grafana and PostgreSQL will be created automatically.

1. Wait 1–2 minutes for initialization
2. Open your Grafana service URL
3. Login with `admin` / `admin`

> **Security**: Change the default password after first login!

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `DATABASE_URL` | Auto-wired | `${{Postgres.DATABASE_URL}}` |
| `PORT` | `3000` | Server port (auto-set by Railway) |
| `GF_SECURITY_ADMIN_USER` | `admin` | Admin username |
| `GF_SECURITY_ADMIN_PASSWORD` | `admin` | Admin password |
| `GF_DEFAULT_INSTANCE_NAME` | `my-instance` | Instance name |
| `GF_INSTALL_PLUGINS` | — | Comma-separated plugin list |

## Installing Plugins

Set `GF_INSTALL_PLUGINS` in your Railway service variables:

```
grafana-clock-panel,grafana-simple-json-datasource
```

Browse the [Grafana Plugin Directory](https://grafana.com/grafana/plugins/) for available plugins.

## Local Development

```bash
cp .env.example .env
docker compose up -d
```

Open http://localhost:3000 and login with `admin` / `admin`.

## Resources

- [Grafana Documentation](https://grafana.com/docs/grafana/latest/)
- [Railway Documentation](https://docs.railway.app/)
- [Grafana Plugin Directory](https://grafana.com/grafana/plugins/)

## License

[MIT](LICENSE)
