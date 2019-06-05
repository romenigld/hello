defmodule HelloWeb.PageView do
  use HelloWeb, :view

  def message do
    "Hello from the view!"
  end

  def handler_info(conn) do
    "Request Handled By: '#{controller_module(conn)}.#{action_name(conn)}'"
  end

  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Map.keys()
  end
end

# Testing
#   iex(5)> Phoenix.View.render(HelloWeb.PageView, "test.html", %{})
# {:safe, ["\nThis is the message: ", "Hello from the view!", "\n"]}

#   iex(6)> r HelloWeb.PageView
#   warning: redefining module HelloWeb.PageView (current version loaded from _build/dev/lib/hello/ebin/Elixir.HelloWeb.PageView.beam)
#     lib/hello_web/views/page_view.ex:1
#   {:reloaded, HelloWeb.PageView, [HelloWeb.PageView]}

#   iex(7)> Phoenix.View.render(HelloWeb.PageView, "test.html", message: "Assigns has an @.")
# {:safe,
#  ["I came from assigns: ", "Assigns has an @.", "\nThis is the message: ",
#   "Hello from the view!", "\n"]}

# Test out the HTML escaping
#   iex(14)> Phoenix.View.render(HelloWeb.PageView, "test.html", message: "<script>badThings();</script>")
# {:safe,
#  [
#    "I came from assigns: ",
#    [
#      [[[[] | "&lt;"], "script" | "&gt;"], "badThings();" | "&lt;"],
#      "/script" |
#      "&gt;"
#    ],
#    "\nThis is the message: ",
#    "Hello from the view!",
#    "\n"
#  ]}

#  rendering the string, without the whole tuple, we can use the render_to_iodata/3.
# iex(20)> Phoenix.View.render_to_iodata(HelloWeb.PageView, "test.html", message: "Assigns has an @.")
# ["I came from assigns: ", "Assigns has an @.", "\nThis is the message: ",
#  "Hello from the view!", "\n"]
