## Why?

+ ### Quick setup

  By using this project template, you can quickly be up and running developing ember-cli projects without having to install any ember development tools on your machine.  All dev tools are pre-installed in a docker container ([danlynn/ember-cli](https://registry.hub.docker.com/u/danlynn/ember-cli/)) that acts just like the tools are installed directly on your machine.

+ ### Command line tools act local

  While inside your project directory tree the ember, npm, bower tools are all redirected to run within the docker container to update the source located on directly on your machine in the project directory.

+ ### Consistent development environments

  By deploying a docker-based development environment to your team, you are assured that everyone has the exact same tools and dependency versions as each other.

+ ### No need for dev tool version management

  Each project has its own docker-compose.yml file which references a specific docker image.  The versions of all the tools and their dependencies are locked-in and specific to each project.  So, unless you change that docker image reference to a newer version, you can be assured that your dev environment is stable and still at the specific versions that it was way back when you were last working on that old project.


## How to use this project template
Basically, you download the source zip from the relases page, expand it, rename the directory, then execute 'docker-compose up'.  Then any npm, bower, or ember commands will automagically be executed within a docker container and will affect the ember project files in the current directory on your machine.

This template can be used to either create a new project or be used with an existing project.  The following is a super quick-start for how to use this project template to create a new running ember app.  A much more detailed version appears further down in the [How to create a new project](#how-to-create-a-new-project) section.

```
$ curl -OL https://github.com/danlynn/ember-cli-docker-template/archive/v0.2.3.tar.gz
$ tar zxvf v0.2.3.tar.gz
$ mv ember-cli-docker-template-0.2.3 my-ember-project
$ cd my-ember-project/
$ eval "$(docker-machine env dev)"
$ ember init
$ docker-compose up
```

Then open the running ember app in your web browser.


## Dependencies
+ boot2docker -or- docker-machine
+ Optionally have rvm installed for automatic command aliasing.

## General Use Commands
When cd'ing into the project directory tree in your local workstation's terminal app, rvm will automagically notice that you have switched to the project and setup the following general use commands.
+ `npm`
+ `bower`
+ `ember`

If you don't have rvm installed then you may manually execute '. setup.sh' from the project root directory before using any of the general use commands.

All of these commands run with the working directory set to the project root directory.  All commands execute within a docker container.

## Service Commands

After adding your ember project files, start the services by simply executing the regular `docker-compose up` command (used to be `fig up`).

```
$ docker-compose up
```

This will start the ember-cli server watching for file changes and refreshing the browser.  The webapp can be accessed at the IP identified via 'boot2docker ip' on port 4200 using your workstations browser.

```
$ docker-machine ip
-or-
$ boot2docker ip

192.168.59.103
```

Then open the following in your browser:

+ http://192.168.59.103:4200

## How to create a new project

First, let's download this ember-cli-docker-template project from the download link found on the github releases page.  I use curl and tar below - but you can just use your browser and dbl-click the downloaded file if you like.

<pre>
<b>$ curl -OL https://github.com/danlynn/ember-cli-docker-template/archive/v0.2.0-beta.1.tar.gz</b>
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   147    0   147    0     0    383      0 --:--:-- --:--:-- --:--:--   383
  0     0    0  4039    0     0   5899      0 --:--:-- --:--:-- --:--:-- 19233
</pre>

Expand the downloaded file:

<pre>
<b>$ tar zxvf 0.2.0-beta.1.tar.gz</b>
x ember-cli-docker-template-0.2.0-beta.1/
x ember-cli-docker-template-0.2.0-beta.1/.rvmrc
x ember-cli-docker-template-0.2.0-beta.1/README-ember-cli-docker.md
x ember-cli-docker-template-0.2.0-beta.1/README.md
x ember-cli-docker-template-0.2.0-beta.1/docker-compose-dev.yml
x ember-cli-docker-template-0.2.0-beta.1/docker-compose.yml
x ember-cli-docker-template-0.2.0-beta.1/setup.sh
</pre>

Rename the expanded directory to whatever you want for a project name:

<pre>
<b>$ mv ember-cli-docker-template-0.2.0-beta.1 my-ember-project</b>
</pre>

`cd` into the new project directory.  Notice that since I have rvm installed, it will notice the `.rvmrc` file in the project directory and ask me if I want to trust it.  I further execute the `rvm rvmrc warning ignore` command so that rvm will no longer bother me about this particular `.rvmrc` file.

<pre>
<b>$ cd my-ember-project/</b>
You are using '.rvmrc', it requires trusting, it is slower and it is not compatible with other ruby managers,
you can switch to '.ruby-version' using 'rvm rvmrc to [.]ruby-version'
or ignore this warning with 'rvm rvmrc warning ignore /Users/danlynn/Documents/JavaScript/Projects/my-ember-project/.rvmrc',
'.rvmrc' will continue to be the default project file in RVM 1 and RVM 2,
to ignore the warning for all files run 'rvm rvmrc warning ignore all.rvmrcs'.

********************************************************************************************************************
* NOTICE                                                                                                           *
********************************************************************************************************************
* RVM has encountered a new or modified .rvmrc file in the current directory, this is a shell script and           *
* therefore may contain any shell commands.                                                                        *
*                                                                                                                  *
* Examine the contents of this file carefully to be sure the contents are safe before trusting it!                 *
* Do you wish to trust '/Users/danlynn/Documents/JavaScript/Projects/my-ember-project/.rvmrc'?                     *
* Choose v[iew] below to view the contents                                                                         *
********************************************************************************************************************
y[es], n[o], v[iew], c[ancel]> <b>y</b>

<b>$ rvm rvmrc warning ignore /Users/danlynn/Documents/JavaScript/Projects/my-ember-project/.rvmrc</b>

<b>$ ls -la</b>
total 64
drwxr-xr-x   8 danlynn  502   272 Mar  3 22:02 .
drwxr-xr-x  22 danlynn  502   748 Mar  3 22:54 ..
-rwxr-xr-x   1 danlynn  502    93 Mar  3 22:02 .rvmrc
-rw-r--r--   1 danlynn  502  8413 Mar  3 22:02 README-ember-cli-docker.md
lrwxr-xr-x   1 danlynn  502    26 Mar  3 22:02 README.md -> README-ember-cli-docker.md
-rw-r--r--   1 danlynn  502   221 Mar  3 22:02 docker-compose-dev.yml
-rw-r--r--   1 danlynn  502   157 Mar  3 22:02 docker-compose.yml
-rwxr-xr-x   1 danlynn  502  1678 Mar  3 22:02 setup.sh
</pre>

Check to see if my docker-machine vm is currently running:

<pre>
<b>$ docker-machine ls</b>
NAME   ACTIVE   DRIVER         STATE     URL                          SWARM
dev             virtualbox     Stopped
dev2   *        vmwarefusion   Running   tcp://192.168.156.132:2376
</pre>

Setup the `docker` command to use the currently running `dev2` docker-machine vm:

<pre>
<b>$ $(docker-machine env dev2)</b>
</pre>

Run `ember init` to populate the current project directory with all the files needed for a runnable ember application.  Note that since this is the first time that I've launched a container that uses the `ember-cli:0.2.0-beta.1` docker image, docker will automagically download and run that container.  After the container launches, the `ember init` command will be executed within that running container.  Note that since `ember init` will create a README.md file, it prompts us to confirm that we want to over-write the existing symlink file of the same name.  We do.  The symlink simply points to the actual `README-ember-cli-docker.md` file.  After answering that prompt, the `ember init` command proceeds to create the default ember app files and download all the node and bower dependencies.

<pre>
<b>$ ember init</b>
Pulling image danlynn/ember-cli:0.2.0-beta.1...
Pulling repository danlynn/ember-cli
ac7370f7bd42: Download complete
511136ea3c5a: Download complete
8771fbfe935c: Download complete
0e30e84e9513: Download complete
c90a56bfe7dd: Download complete
6b030fdd4748: Download complete
787349ce806c: Download complete
70a6b638a713: Download complete
be7f2e01d4b1: Download complete
2d3fb7a55e9c: Download complete
d8b52c267f8b: Download complete
f60f6620117e: Download complete
afa8ed8d6341: Download complete
7406fb0e0a93: Download complete
a225ea4fc72f: Download complete
41c1c3e2c098: Download complete
c48c5a0ca6c8: Download complete
Status: Downloaded newer image for danlynn/ember-cli:0.2.0-beta.1
version: 0.2.0-beta.1
Could not find watchman, falling back to NodeWatcher for file system events
installing
[?] Overwrite README.md? <b>Yes, overwrite</b>
  create .bowerrc
  create .editorconfig
  create .ember-cli
  create .jshintrc
  create .travis.yml
  create Brocfile.js
  overwrite README.md
  create app/app.js
  create app/components/.gitkeep
  create app/controllers/.gitkeep
  create app/helpers/.gitkeep
  create app/index.html
  create app/models/.gitkeep
  create app/router.js
  create app/routes/.gitkeep
  create app/styles/app.css
  create app/templates/application.hbs
  create app/templates/components/.gitkeep
  create app/views/.gitkeep
  create bower.json
  create config/environment.js
  create .gitignore
  create package.json
  create public/crossdomain.xml
  create public/robots.txt
  create testem.json
  create tests/.jshintrc
  create tests/helpers/resolver.js
  create tests/helpers/start-app.js
  create tests/index.html
  create tests/test-helper.js
  create tests/unit/.gitkeep
  create vendor/.gitkeep
Installed packages for tooling via npm.
Installed browser packages via Bower.
Removing myemberproject_ember_run_1...
</pre>

Launch the ember-cli server and open up the ember app in your browser using the IP of the `dev2` docker machine: `http://192.168.156.132:4200`.

<pre>
<b>$ docker-compose up</b>
Creating myemberproject_server_1...
Attaching to myemberproject_server_1
server_1 | version: 0.2.0-beta.1
server_1 | Livereload server on port 35729
server_1 | Serving on http://0.0.0.0:4200/
server_1 |
server_1 | Build successful - 6969ms.
server_1 |
server_1 | Slowest Trees                  | Total
server_1 | -------------------------------+----------------
server_1 | Concat: Vendor                 | 4615ms
server_1 |
</pre>

## Performance Considerations

If using VirtualBox to host your boot2docker vm then you may notice that the default VirtualBox shared folders feature is inexplicably slow.  This is a known issue with VirtualBox in general.  To work around this, reconfigure the boot2docker vm to use nfs instead.

A similar issue exists if you are using VMware Fusion.  Except in this situation, the vmwarefusion driver for docker-machine simply doesn't have the shared folder functionality in place yet.  Thus, you can fall back to using NFS shares.

This process is pretty straight forward if your host computer's OS is OSX or Linux.  The following are the instructions for OSX.

### How to mount OSX dirs as NFS shares

1. Use the VirtualBox gui app to remove the /Users share that is defined when the boot2docker vm is created.
2. On your OSX host machine, add the following line to the `/etc/exports` file.  Replace 'danlynn' with your own unix account name:

   ```
   /Users -alldirs -maproot=danlynn -network 192.168.99.0 -mask 255.255.255.0
   ```

   The 192.168.99.0 IP assumes that you are using VirtualBox which defaults to that IP range.  If you are using VMware Fusion instead then replace that IP with 192.168.156.0 since Fusion defaults to that IP range.

   Note that you may need to create this file if it does not already exist.  It should be permissioned as follows:

   ```
   -rw-r--r--  root  wheel  /etc/exports
   ```

3. Restart the nfs daemon:

   ```
   sudo nfsd restart
   ```

4. Start the boot2docker vm using one of the following depending on whether you are using docker-machine or the regular boot2docker to manage your vm:

	```
	$ docker-machine start dev
	-or-
	$ boot2docker --vbox-share=disable start
	```

	Note that we added the `--vbox-share=disable` option to prevent boot2docker from just re-creating the /Users share with VirtualBox shared folders upon start.

5. ssh into the boot2docker vm.  Note that we are ssh'ing into the docker container host - not into any container.  We need to configure the boot2docker vm linux instance to connect to the nfs share that we defined on our OSX machine.

	```
	$ docker-machine ssh
	-or-
	$ boot2docker ssh
	```

6. Add the following 2 lines to the end of the `/var/lib/boot2docker/profile` file in the boot2docker vm.  If the file does not already exist then you may need to update to a newer version of the boot2docker.iso.

   ```
   mkdir /Users
   sudo mount -t nfs -o vers=3,nolock,udp 192.168.99.1:/Users /Users
   ```

   The 192.168.99.1 IP assumes that you are using VirtualBox which defaults to that IP range.  If you are using VMware Fusion instead then replace that IP with 192.168.156.1 since Fusion defaults to that IP range.

7. Restart the boot2docker vm:

   ```
   $ docker-machine restart dev
   -or-
   $ boot2docker stop
   $ boot2docker --vbox-share=disable start
   ```

8. Test that the nfs share is working.
   1. First, verify in the VitualBox gui app that the /Users share is still gone.  We want it to be gone.
   2. Next, ssh back into the boot2docker vm:

      ```
      $ docker-machine ssh dev
      -or-
      $ boot2docker ssh
      ```

   3. List the contents of the /Users dir to make sure that it is accurately reflecting the actual contents of the /Users directory on your OSX host then exit back out.

      ```
      $ ls -la /Users
      drwxr-xr-x    8 root     80       272 Oct 18 05:05 ./
      drwxr-xr-x   17 root     root     400 Feb 24 22:05 ../
      -rw-r--r--    1 root     root       0 Sep  9 22:16 .localized
      drwxrwxrwt   16 root     root     544 Oct 18 04:04 Shared/
      drwxr-xr-x   45 501      20      1530 Feb 24 15:15 administrator/
      drwxr-xr-x  156 502      502     5304 Feb 25 00:29 danlynn/
      drwxr-xr-x   16 503      20       544 Feb 15 17:50 somebody/
      $ exit
      ```

   4. Start a bash shell in a container with a volume mapping the current directory with the container (replacing the host OSX path with one valid for your machine).

      ```
      $ docker run -t -i --entrypoint /bin/bash -v /Users/danlynn/Documents/JavaScript/Projects/ember-cli-docker-sample2:/myapp ubuntu:14.04
      ```

      The `ubuntu:14.04` image is a small container that installs and runs quickly.  This makes it ideal for a quick test of the volume mapping.

   5. List the contents of the /myapp dir in the docker container.  Verify that contents match those of the host OSX directory that you mapped to it:

      ```
      # ls -la /myapp
      drwxr-xr-x 26  502  502  884 Feb 25 03:26 .
      drwxr-xr-x 33 root root 4096 Feb 25 03:27 ..
      -rwxr-xr-x  1  502  502   93 Feb 24 20:34 .rvmrc
      -rw-r--r--  1  502  502 5106 Feb 25 03:26 README.md
      -rw-r--r--  1  502  502  266 Feb 19 05:40 docker-compose-dev.yml
      -rw-r--r--  1  502  502  151 Feb 13 13:44 docker-compose.yml
      -rwxr-xr-x  1  502  502 1678 Feb 24 22:27 setup.sh
      ```


