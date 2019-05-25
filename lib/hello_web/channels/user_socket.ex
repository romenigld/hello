defmodule HelloWeb.UserSocket do
  use Phoenix.Socket

  channel "room:lobby", HelloWeb.RoomChannel

  def connect(params, socket) do
    {:ok, assign(socket, :user_id, params["user_id"])}
  end
end
