defmodule AppWeb.PageController do
  use AppWeb, :controller

  def index(conn, _params) do
    org_name = "myorg"
    repo_name = "public-repo"
    file_name = "README.md"
    {:ok, %HTTPoison.Response{ body: response_body}} = 
      Gogs.remote_read_raw(org_name, repo_name, file_name)
    render(conn, "index.html", text: response_body)
  end
end
