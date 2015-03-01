## Why?
By using this project template, you can quickly be up and running developing ember-cli projects without having to install any ember development tools on your machine.

## How to use this project template
Basically, you download the source zip from the relases page, expand it, rename the directory, then execute 'docker-compose up'.  Then any npm, bower, or ember commands will automagically be executed within a docker container and will affect the ember project files in the current directory on your machine.

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

First, download the latest release of this template.  There is no need to clone this template unless you plan on forking it and adding your own improvements.  The latest project template can be downloaded from:

+ [https://github.com/danlynn/ember-cli-docker-template/releases](https://github.com/danlynn/ember-cli-docker-template/releases)

This ember-cli-docker-template starts out with only the following files:

```
-rwxr-xr-x@  .rvmrc
-rw-r--r--@  README-ember-cli-docker.md
lrwxr-xr-x@  README.md -> README-ember-cli-docker.md
-rw-r--r--@  docker-compose-dev.yml
-rw-r--r--@  docker-compose.yml
-rwxr-xr-x@  setup.sh
```

Starting with these initial files, execute the following commands to create a new ember.js project in the current directory.  Note that the template project assumes that the root dir of the template is where your ember project files will be created.

1. Rename the project root directory to whatever you want for a project name.
2. Make sure that the boot2docker vm is running:

   ```
   $ docker-machine ls
   -or-
   $ boot2docker status
   ```
   
   Start it if it isn't running:
   
   ```
   $ docker-machine start dev
   -or-
   $ boot2docker --vbox-share=disable start
   ```
   
3. cd into that project directory.
4. Do an 'ember init' to create a new ember project in the current project dir.

Note that the original README.md is just a link to the README-ember-cli-docker.md file.  This is so that this project will show the correct README on the github homepage while still allowing the 'ember init' command to blow away the README.md link.  This way, your own project's README.md will take its place while still retaining the original README-ember-cli-docker.md.

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

6. Add the following 2 lines to the end of the `/var/lib/boot2docker/profile` file in the boot2docker vm.  If the file does not already exist then you man need to update to a newer version of the boot2docker.iso.

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
      
   