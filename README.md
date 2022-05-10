<div align="center">

<img src="https://user-images.githubusercontent.com/194400/167251193-e0cb2874-88f0-4a78-a752-1a0f9d253e10.png"
  alt="gogs elixir interface demo application!">

A fully functional **demo** app
showing interaction between an<br />
**`Elixir`** (**`Phoenix`**) App
and **`Gogs`** server
using the
[`gogs`](https://github.com/dwyl/gogs) package. <br />
**_Step-by-step_ tutorial** showing you how to do it yourself!

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/dwyl/gogs-demo/Elixir%20CI?label=build&style=flat-square)](https://github.com/dwyl/gogs-demo/actions/workflows/ci.yml)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/gogs-demo/main.svg?style=flat-square)](http://codecov.io/github/dwyl/gogs-demo?branch=main)
[![Hex.pm](https://img.shields.io/hexpm/v/gogs?color=brightgreen&style=flat-square)](https://hex.pm/packages/gogs)
[![Libraries.io dependency status](https://img.shields.io/librariesio/release/hex/gogs?logoColor=brightgreen&style=flat-square)](https://libraries.io/hex/gogs)
[![docs](https://img.shields.io/badge/docs-maintained-brightgreen?style=flat-square)](https://hexdocs.pm/gogs/api-reference.html)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/gogs-demo/issues)
[![HitCount](http://hits.dwyl.com/dwyl/gogs-demo.svg)](http://hits.dwyl.com/dwyl/gogs-demo)

</div>

# _Why_? 🤷

As software engineers we are 
[**_always learning_ `new` things**](https://twitter.com/nelsonic/status/913811339709173760). <br />
When we learn,
we love having _detailed docs and **examples**_
that explain _exactly_ how to get up-and-running. <br />
**`@dwyl`** we _write_ examples because we want them _ourselves_.
**_Comprehensive_ docs/tutorials**
are a _gift_ to our future selves and teammates. 🎁 
They allow us to get up-to-speed
or remember what's going on
especially when returning to a project after a while.
We constantly refer back to them 
and update them when required.
If you find them useful, please ⭐ the repo to let us know.

# _What_? 💭

This project is a _barebones_ demonstration
of using
[`gogs`](https://github.com/dwyl/gogs)
in any **`Phoenix`** App. <br />
It's intended to be beginner-friendly
and focus on showcasing **_one_ thing**.

It can be used as the basis for another app
or you can borrow chunks of setup/code.

# _Who_? 👥

This demo is intended for people of all Elixir/Phoenix skill levels. <br />
Following all the steps in this example should take around **`10 minutes`**. <br />
If you get stuck, please _don't suffer_ in silence!
**Get help** by opening an issue:
[github.com/dwyl/**gogs-demo/issues**](https://github.com/dwyl/gogs-demo/issues)

<br />

# _How?_ 💻

### 0. Prerequisites 📝 

_Before_ you start,
make sure you have the following installed:

1. `Elixir`: https://elixir-lang.org/install.html <br />
   New to `Elixir`? see: 
   [github.com/dwyl/**learn-elixir**](https://github.com/dwyl/learn-elixir)
2. `Phoenix`: https://hexdocs.pm/phoenix/installation.html <br />
   New to `Phoenix`? see:
   [github.com/dwyl/**learn-phoenix-framework**](https://github.com/dwyl/learn-phoenix-framework)

<br />

### 1. Create a New `Phoenix` App 🆕 

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

#### Checkpoint: Working `Phoenix` App 🏁 

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

### 2. Add `gogs` to `deps` ⬇️ 

Open the 
[`mix.exs`]()
file,
locate the `defp deps do` section and add the following line:

```elixir
{:gogs, "~> 0.6.0"},
```

Once you've saved your `mix.exs` file, 
run: 
```sh
mix deps.get
```

### 3. Setup: Environment Variables 📝

To get the **`gogs`** package working in your **`Phoenix`** App,
you will need 4 environment variables:
[**`.env_sample`**](https://github.com/dwyl/gogs/blob/main/.env_sample)

1. `GOGS_URL` - the domain where your Gogs Server is deployed,
   without the protocol, <br />
   e.g: `gogs-server.fly.dev`

2. `GOGS_ACCESS_TOKEN` - the REST API Access Token 
See: 
[gogs-server#connect-via-rest-api-https](https://github.com/dwyl/gogs-server#connect-via-rest-api-https)

3. `GOGS_SSH_PRIVATE_KEY_PATH` - absolute path to the `id_rsa` file
  on your `localhost` or `Phoenix` server instance.

4. `GOGS_SSH_PORT` - The TCP port allocated to SSH on your Gogs Server,
   in our case it's: `10022`.

> If you're new to Environment Variables
> Please see: 
> [github.com/dwyl/**learn-environment-variables**](https://github.com/dwyl/learn-environment-variables)

#### Context: `Gogs` Server on Fly.io

In _our_ case our **`Gogs`** Server instance
is deployed to [fly.io](https://fly.io/)
at:
[gogs-server.fly.dev](https://gogs-server.fly.dev/) <br />
To understand how this was deployed, 
please see: 
[github.com/dwyl/**gogs-server**](https://github.com/dwyl/gogs-server)

<br />

### 4. Create Function to Interact with Gogs Repo

As noted in the first step above, 
the homepage of our app 
is the default `Phoenix` homepage.

In this section we're going to change that!

Open the `lib/app_web/controllers/page_controller.ex` file.
You should see the following:

```elixir
defmodule AppWeb.PageController do
  use AppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
```

Inside the file, 
replace the `index/2` function with the following:

```elixir
  def index(conn, _params) do
    org_name = "myorg"
    repo_name = "public-repo"
    file_name = "README.md"
    {:ok, %HTTPoison.Response{ body: response_body}} = 
      Gogs.remote_read_raw(org_name, repo_name, file_name)
    render(conn, "index.html", text: response_body)
  end
```

### 4.1 Update the Template to Display the Text

Open the file:
`lib/app_web/templates/page/index.html.heex`

And replace the 2nd `<section>` block with:

```html

```


If you want to make this raw `markdown` data _look_ good,
we need to add some `JavaScript` magic:


```html
<div id="content"></div>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>
   document.getElementById('content').innerHTML =
   marked.parse('# Marked in the browser\n\nRendered by **marked**.');
</script>
```

![image](https://user-images.githubusercontent.com/194400/167685396-207cc12f-d722-4ca3-8582-f7563597bcff.png)



<br />

# _Bonus Level_: _Optional_ UI/UX! 💃 



#### ⚠️ Warning: the next 2 steps will _temporarily_ "break" the Phoenix app. Be patient and keep going!


## 4. Create 2 New Files ➕

Create two new directories`lib/app_web/live`

e.g:

```sh
mkdir lib/app_web/live
mkdir 
```



Create 2 new file with the following paths:
1. 

### Note on **`Phoenix`** **`LiveView`**

In this demo we will be using **`Phoenix`** **`LiveView`**
because we feel that the programming model 
is simpler than "MVC" 
from a dev perspective. 

If you are new to **`LiveView`**,
please see our complete beginners' tutorial:
[github.com/dwyl/**phoenix-liveview-counter-tutorial**](https://github.com/dwyl/phoenix-liveview-counter-tutorial)



### The Repo!

https://gogs-server.fly.dev/demo-org/gogs-demo




### 

This Rich Text Editor is based off our work in:
[github.com/nelsonic/amemo](https://github.com/nelsonic/amemo/tree/3a3872663698d93abe29a75add462a7f4285ac26)


## Checkpoint: Working on `localhost` 🏁 


## X. _Deploy_ to Fly.io 🚀 

> Need to document how to deploy the Phoenix App to Fly.io
> Will return to this tomorrow. `#EnoughScreens` for today.

### Create new Org on Fly.io (Optional)

https://fly.io/organizations