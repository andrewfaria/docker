# Grunt, Bower, yo (express), and Docker goodness

94% reduction in size compared to Docker `ubuntu:14.04`

97MB container

* `FROM gliderlabs/alpine:3.2`
* `VOLUME /app`
* port `3000` (web)
* port `35729` (livereload)
* be sure to edit html header template to match your localhost/ip for livereload
* be sure to map livereload port directly `-p 35729:35729`

# How to use this image

## Building the image
1. Checkout this repo
2. Navigate to `docker/dev-grunt-express`
3. Build...

```
docker build -t dev-grunt-express .
```

## Starting a new app
Note: if you are using `boot2docker`, I found it much easier to ssh into the docker vm to mount local volumes.

1. `boot2docker ip`, usually 192.168.59.103
2. Putty *(or your terminal of choice)* into VM, `login:docker`, `password:tcuser`, unless you changed it.
3. On Windows, the shared path is usually `/c/Users/<you>/`. Create a data directory for you to use... i.e. `/c/Users/<you>/docker/data/yourapp`
4. Navigate into your new directory. This is important for the docker run command below.
5. Fire away in interactive mode first...

  ```sh
  docker run -it --rm -v $(pwd):/app -p 3000:3000 -p 35729:35729 dev-grunt-express bash
  ```

6. run `yo generator-express`
9. Modify your `layout.jade` (or related html header template file) and change the livereload script tag to reference your IP instead of `localhost`:

  assuming jade:

  ```jade
  if ENV_DEVELOPMENT
    script(src='http://192.168.59.103:35729/livereload.js' async)
  ```

DONE.

You can now view your work at the docker ip address, usual default is `192.168.59:103:3000`


## Running the app

Note: to use the `$(pwd)` variable below, be sure you are inside your app root directory. Otherwise, you must replace `$(pwd)` with an absolute path to your project.

```sh
docker run -d -p 3000:3000 -p 35729:35729 -v $(pwd):/app --name theapp dev-grunt-express
```

# Contributions

This is still a work-in-progress. Contributions, comments, criticism welcome!
