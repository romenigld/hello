defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug :assign_welcome_message, "'Hi with plug!'" when action in [:index]

  defp assign_welcome_message(conn, msg) do
    assign(conn, :default_message, msg)
  end

  def index(conn, _params) do

    conn
    |> put_layout("admin.html")
    |> assign(:message, "'Welcome by controller!'")
    |> render("index.html")


     # |> put_resp_content_type("text/plain")
     # |> send_resp(201, "") # send a response with a status of "201" with no body whatsoever and show us a completely blank page.

    # |> assign(:message, "'Welcome by controller!'")
    # |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    # |> put_flash(:error, "Let's pretend we have an error.")
    # |> render("index.html")
  end
end
