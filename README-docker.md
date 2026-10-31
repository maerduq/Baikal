
Build the docker image with:

```bash
./docker-build
```

Then run the image with:

```bash
docker run -it --init --rm --publish 8000:80 baikal:{tag}
```

Or copy-paste the tar-file to your server that has been created in the `/out` folder.
