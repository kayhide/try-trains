## Start server

### Set environment variables

To start a Trains server, the following variables are required.

- TRAINS_HOST_IP
- TRAINS_ROOT

`TRAINS_HOST_IP` is the local IP address of your working machine.

`TRAINS_ROOT` is a directory where the server stores data.
It is good to set `$(pwd)/.trains` under the root of this repository.

Example:

- TRAINS_HOST_IP=192.168.12.34
- TRAINS_ROOT=/home/of/my/projects/try-trains/.trains

### Start a server

```console
$ make dev
```

## Run tasks

### Setup python

Since Trains works on python script, prepare python and install pip packages.

`shell.nix` may help to install python.

To install pip packages, run:

```console
$ pip install -r requirements.txt
```

### Collect credentials

After starting a server, access to

```
http://localhost:8080/
```

and login by entering your name.

Then go to

```
http://localhost:8080/profile
```

and click **Create new credentials** at the **App Credentials** section.


Copy the credentials and run:

```console
$ trians-init
```

it will ask you to paste credentials.

Paste your credentials you copied erlier.

The config is stored at `~/trains.conf`.

You can also give credentials by setting the following environment variabls:

- TRAINS_API_ACCESS_KEY
- TRAINS_API_SECRET_KEY

These take precedence over the `~/trains.conf`.

### Execute

Run:

```console
$ python empty.py
```

This script does nothing but create a task.

You can see the logs on the browser and make sure the server and the task script working properly.


Finally, do some actul traing:

```console
$ python mnist.py
```

It will output its progress on you terminal.

After finishing, you will see the result on the browser.
