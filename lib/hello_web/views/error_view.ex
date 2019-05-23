defmodule HelloWeb.ErrorView do
  use HelloWeb, :view

# For test:  http://localhost:4000/such/a/wrong/path
  # def render("404.html", _assigns) do
  #   "Page not found"
  # end

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  def render("500.html", _assigns) do
    "Internal Server Error"
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
