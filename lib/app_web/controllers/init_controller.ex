defmodule AppWeb.InitController do
  use AppWeb, :controller
  require Logger

  @env_required ~w/GOGS_URL GOGS_SSH_PORT GOGS_ACCESS_TOKEN SECRET_KEY_BASE FLY_APP_NAME/
  @env_optional ~w/GIT_TEMP_DIR_PATH/

  def index(conn, _params) do

    Envar.get("GOGS_URL") |> Logger.debug
    Gogs.api_base_url() |> Logger.debug

    init = if Envar.is_set_all?(@env_required) do
      "all env vars are defined"
    else
      "cannot be run until all required environment variables are set"
    end

    conn
    # |> assign(:env, check_env())
    |> render(:index,
      layout: {AppWeb.InitView, "init_layout.html"}, 
      env: check_env(@env_required),
      env_optional: check_env(@env_optional),
      init: init
    )
  end

  defp check_env(keys) do
    Enum.reduce(keys, %{}, fn key, acc ->
      Map.put(acc, key, Envar.is_set?(key))
    end)
  end
end
