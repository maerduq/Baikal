
Build the docker image with:

```bash
./docker-build
```

Then run the image with:

```bash
docker run -it --init --rm --publish 8000:80 baikal:{tag}
```

To save the image to file:

```bash
docker save baikal:{tag} -o baikal-{tag}.tar
```
