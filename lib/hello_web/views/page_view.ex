defmodule HelloWeb.PageView do
  use HelloWeb, :view
  alias HelloWeb.AuthorView

  def render("page_with_authors.json", %{page: page}) do
    %{title: page.title,
      authors: render_many(page.authors, AuthorView, "author.json", as: :writer)}
  end

  def render("index.json", %{pages: pages}) do
    %{data: render_many(pages, HelloWeb.PageView, "page.json")}
  end

  def render("show.json", %{page: page}) do
    %{data: render_one(page, HelloWeb.PageView, "page.json")}
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end
  # def render("index.html", assigns) do
  #   "rendering with assigns #{inspect Map.keys(assigns)}"
  # end

  def message do
    "Hello from the view!"
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
