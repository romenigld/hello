defmodule HelloWeb.PostFinder do
  # use Plug
  # import Plug.Conn
  #
  # alias Hello.Blog
  #
  # def init(opts), do: opts
  #
  # def call(conn, _) do
  #   case Blog.get_post(conn.params["id"]) do
  #     {:ok, post} ->
  #       assign(conn, :post, post)
  #     {:error, :notfound} ->
  #       conn
  #       |> send_resp(404, "Not found")
  #       |> halt() # prevent downstream plugs from being invoked but it will not stop the execution of code locally.
  #                 # It's also important to note that halting will only stop the plug pipeline from continuing.
  #                 # Function plugs will still execute unless their implementation checks for the :halted value.
  #   end
  # end
end
