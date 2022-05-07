<div align="center">

<img src="https://user-images.githubusercontent.com/194400/167251193-e0cb2874-88f0-4a78-a752-1a0f9d253e10.png"
  alt="gogs elixir interface demo application!">

A fully functional **demo** app
showing interaction <br />
between an **`Elixir`** (**`Phoenix`**) web App <br />
and **`Gogs`** (`Git`) server <br />
using the
[`gogs`](https://github.com/dwyl/gogs) package.
**_Step-by-step_ tutorial** showing you how to do it yourself!

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/dwyl/gogs/Elixir%20CI?label=build&style=flat-square)](https://github.com/dwyl/gogs/actions/workflows/ci.yml)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/gogs/master.svg?style=flat-square)](http://codecov.io/github/dwyl/gogs?branch=main)
[![Hex.pm](https://img.shields.io/hexpm/v/gogs?color=brightgreen&style=flat-square)](https://hex.pm/packages/gogs)
[![Libraries.io dependency status](https://img.shields.io/librariesio/release/hex/gogs?logoColor=brightgreen&style=flat-square)](https://libraries.io/hex/gogs)
[![docs](https://img.shields.io/badge/docs-maintained-brightgreen?style=flat-square)](https://hexdocs.pm/gogs/api-reference.html)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/gogs/issues)
[![HitCount](http://hits.dwyl.com/dwyl/gogs-demo.svg)](http://hits.dwyl.com/dwyl/gogs-demo)

</div>

# _Why_? 🤷

As developers we are _always learning_ new things.
When we learn,
we love having _detailed docs and **examples**_
that explain _exactly_ how to get up-and-running.
We _write_ examples because we want them _ourselves_,
if you find them useful, please :star: the repo to let us know.

# _What_? 💭

This project is intended as a _barebones_ demonstration
of using
[`gogs`](https://github.com/dwyl/gogs)
in any Phoenix Application.

# _Who_? 👥

This demos is intended for people of all Elixir/Phoenix skill levels.

Following all the steps in this example should take around 10 minutes.
However if you get stuck, please don't suffer in silence!
Get help by opening an issue:
https://github.com/dwyl/gogs-demo/issues

<br />

# _How?_ 💻

### 0. Prerequisites

_Before_ you start,
make sure you have the following installed:

1. `Elixir`: https://elixir-lang.org/install.html <br />
   New to `Elixir`? see: https://github.com/dwyl/learn-elixir
2. `Phoenix`: https://hexdocs.pm/phoenix/installation.html <br />
   New to `Phoenix`? see:
   https://github.com/dwyl/learn-phoenix-framework

<br />

### 1. Create a New `Phoenix` App

For this example,
we are creating a _basic_ **`Phoenix`** App
without the live dashboard or mailer (email)
or `Ecto` (Postgres database)
because we don't need those components
in order to showcase the `gogs` package.

```sh
mix phx.new app --no-ecto --no-dashboard --no-mailer
```

When prompted to install dependencies:

```sh
Fetch and install dependencies? [Yn]
```

Type `y` and hit the `[Enter]` key to install.

You should see something like this:

```sh
* running mix deps.get
* running cd assets && npm install && node node_modules/webpack/bin/webpack.js
* running mix deps.compile
```

#### Checkpoint: Working `Phoenix` App

Change into the directory of your newly created `Phoenix` app

```sh
cd app
```

And start the app:

```sh
mix setup
mix phx.server
```

You should see output similar to the following:

```sh
Generated app app
[info] Running AppWeb.Endpoint with cowboy 2.9.0 at 127.0.0.1:4000 (http)
[info] Access AppWeb.Endpoint at http://localhost:4000
[debug] Downloading esbuild from https://registry.npmjs.org/esbuild-darwin-64/-/esbuild-darwin-64-0.14.29.tgz
[watch] build finished, watching for changes...
```

That confirms the app is working.

Open your web browser to the URL: http://localhost:4000

You should see the default **`Phoenix`** home page:

<img width="828" alt="image" src="https://user-images.githubusercontent.com/194400/165493125-0e714185-e268-411f-bb7d-99f7cd0eb8ba.png">

So far so good. 👌 <br />

### 2. Add `gogs` to `deps`

Open the 
[`mix.exs`]()
file,
locate the `defp deps do` section and add the following line:

```elixir

```

### X. _Deploy_ to Fly.io
