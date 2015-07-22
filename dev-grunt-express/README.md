# Grunt, Bower, yo (express), and Docker goodness

* version agnostic `:latest`
* `VOLUME /app`
* port `3000` (web)
* port `35729` (livereload)
* be sure to edit `layout.jade` to match your localhost/ip for livereload
* be sure to map livereload port directly `-p 35729:35729`
* `npm install` must be run in sudo with `--no-bin-link` flag

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

 ```
 docker run -it --rm -v $(pwd):/app -p 3000:3000 -p 35729:35729 dev-grunt-express bash
 ```

 6. run `yo generator-express`
 7. when yo gets to the auto `npm install && bower install`, Ctrl+c out. I haven't been able resolve this issue other than the next step
 8. manually install packages:

 ```sudo npm install --no-bin-link```

 ```bower install```
 9. DONE

 ## Running the app

 Note: to use the `$(pwd)` variable below, be sure you are inside your app root directory.

 ```
 docker run -d -p 3000:3000 -p 35729:35729 -v $(pwd):/app --name theapp dev-grunt-express
 ```
