defmodule AdminWeb.PageController do
  use AdminWeb, :controller

  alias Admin.Auth
  alias Admin.Auth.User
  alias Admin.Auth.Guardian


  def index(conn, _params) do
    maybe_user = Guardian.Plug.current_resource(conn)
    render conn, "index.html", maybe_user: maybe_user
  end

  def login(conn, _params) do
    changeset = Auth.change_user(%User{})
    maybe_user = Guardian.Plug.current_resource(conn)
    # message = if maybe_user != nil do
    #   "Someone is logged in"
    # else
    #   "No one is logged in"
    # end

    conn
    # |> put_flash(:info, message)
    |> render("login.html", changeset: changeset, action: "/login", maybe_user: maybe_user)
  end

  def login_action(conn, %{"user" => %{"name" => name, "password" => password}}) do
    Auth.authenticate_user(name, password)
    |> login_reply(conn)
  end
  defp login_reply({:error, error}, conn) do
    conn
    |> put_flash(:error, error)
    |> redirect(to: "/login")
  end
  defp login_reply({:ok, user}, conn) do
    conn
    |> put_flash(:success, "Welcome back!")
    |> Guardian.Plug.sign_in(user)
    |> redirect(to: "/")
  end
  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: "/")
  end
  def secret(conn, _params) do
    render(conn, "secret.html")
  end
end
