defmodule DiscussWeb.Plugs.RequireAuth do
  import Plug.Conn
  alias DiscussWeb.Router.Helpers
  import Phoenix.Controller

  def init(_params) do

  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "You must be looged in")
      |> redirect(to: Helpers.topic_path(conn, :index))
      |> halt()
    end
  end
end
