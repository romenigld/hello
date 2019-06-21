defmodule Hello.UserRegistration do
  alias Ecto.Multi
  alias Hello.{Accounts, CMS}
  alias Hello.Repo

  def register_user(params) do
    Multi.new()
    |> Multi.run(:user, fn _ -> Accounts.create_user(params) end)
    |> Multi.run(:author, fn %{user: user} ->
      {:ok, CMS.ensure_author_exists(user)}
    end)
    |> Repo.transaction()
  end
end
