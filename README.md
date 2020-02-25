# Docker dashd
Docker dashd build

### Docker Hub automated builds configuration
1. Configure automated Docker Hub builds
    1. use `Source Type`: `Tag`
    1. use `Source`: `/^v?[0-9\.]+$/`
    1. use `Docker Tag`: `{sourceref}`
1. Use this code as example to trigger specific version build via git tag. Check upstream docker image version exists before proceed.
```bash
git clone git@github.com:blockchain-etl/docker-dashd.git
cd docker-dashd
git tag 0.15
git tag 0.15.0
git tag 0.15.0.0
git push origin 0.15 0.15.0 0.15.0.0
```
