defmodule Admin.Auth.ErrorHandler do
    import Plug.Conn

    def auth_error(conn, {type, reason}, _opts) do
        body = "#{type}: #{inspect reason}"
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(401, body)
        |> halt
    end
end