defmodule TerrManWeb.SessionController do
    use TerrManWeb, :controller

    alias TerrManWeb.Accounts
    
    def new(conn, _) do
        render(conn, "new.html")
    end

    def create(conn, %{"user" => %{"email" => email, "password" => password }}) do
        case Accounts.authenticate_by_email_and_password(email,password) do
        {:ok, user} ->
          conn
          |> put_flash(:info, "Welcome back!")
          |> put_session(:user_id, user.id)
          |> configure_session(renew: true)
          |> redirect(to: "/")
        {:error, :unauthorized} ->
          conn
          |> put_flash(:error, "Bad email/password")
          |> redirect(to: Routes.session_path(conn, :new))
        end
    end

    def delete(conn, %{"id" => :user_id}) do
        conn
        |> configure_session(drop: true)
        |> redirect(to: "/")
    end

end