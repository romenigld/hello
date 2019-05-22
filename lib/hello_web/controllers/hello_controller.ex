defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, params) do

    # redirect(conn, external: "https://elixir-lang.org/")

    # redirect(conn, to: "/redirect_test")
    # redirect(conn, to: Routes.redirect_test_path(conn, :redirect_test))

    # redirect(conn, external: Routes.redirect_test_url(conn, :redirect_test))
    # redirect(conn, to: Routes.redirect_test_url(conn, :redirect_test)) # this will fail

    # conn
    # |> put_status(:not_found)
    # |> put_view(HelloWeb.ErrorView)
    # |> render("404.html") # The correct way to render the 404 page

    # |> put_status(202) # function of the Plug.Conn.put_status/2
    # |> render("index.html")

    # |> put_resp_content_type("text/xml")
    # |> render("index.xml", content: some_xml_content)

    # |> render("index.text", message: params["message"]) # access by http://localhost:4000/hello/?_format=text&message=Romenig%20Lima%20Damasio

    #|> put_layout(false) #  page without a layout.

    #|> render(:index) # if go to http://localhost:4000/hello/?_format=text will see 'OMG, this is actually some text.''
  end

  def redirect_test(conn, _params) do
    text(conn, "Redirect!")
  end

  def show(conn, %{"messenger" => messenger} = params) do
    render(conn, "show.html", messenger: messenger)
  end
end
