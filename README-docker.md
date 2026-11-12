
Build the docker image with:

```bash
./docker-build
```

Then run the image with:

```bash
docker run -it --init --rm --publish 8000:80 baikal:{tag}
```

Or copy-paste the tar-file to your server that has been created in the `/out` folder.

## SBOM

```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$(pwd)/out:/out" anchore/syft:latest baikal:{tag} -o cyclonedx-json=/out/sbom-{tag}.json
```