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

  ```sh
  docker run -it --rm -v $(pwd):/app -p 3000:3000 -p 35729:35729 dev-grunt-express bash
  ```

6. run `yo generator-express`
7. when yo gets to the auto `npm install && bower install`, Ctrl+c out. I haven't been able resolve this issue other than the next step
8. manually install packages:

  `sudo npm install --no-bin-link`

  `bower install`
9. Modify your `layout.jade` *(assuming you chose the jade rendering engine)* file and change the livereload script tag to reference your IP instead of `localhost`:

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

## License

Copyright (C) 2015 Andrew J Faria

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
