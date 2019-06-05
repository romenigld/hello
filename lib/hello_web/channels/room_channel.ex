defmodule HelloWeb.RoomChannel do
  use Phoenix.Channel
  alias HelloWeb.Presence

  def join("room:lobby", _params, socket) do
    send(self(), :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    push(socket, "presence_state", Presence.list(socket))
    {:ok, _} = Presence.track(socket, socket.assigns.user_id, %{
      online_at: inspect(System.system_time(:second))
    })
    {:noreply, socket}
  end
end

# Example generated by the command 'mix phx.gen.channel Room'
# defmodule HelloWeb.RoomChannel do
#   use HelloWeb, :channel
#
#   def join("room:lobby", payload, socket) do
#     if authorized?(payload) do
#       {:ok, socket}
#     else
#       {:error, %{reason: "unauthorized"}}
#     end
#   end
#
#   # Channels can be used in a request/response fashion
#   # by sending replies to requests from the client
#   def handle_in("ping", payload, socket) do
#     {:reply, {:ok, payload}, socket}
#   end
#
#   # It is also common to receive messages from the client and
#   # broadcast to everyone in the current topic (room:lobby).
#   def handle_in("shout", payload, socket) do
#     broadcast socket, "shout", payload
#     {:noreply, socket}
#   end
#
#   # Add authorization logic here as required.
#   defp authorized?(_payload) do
#     true
#   end
# end

# Example used of the Channel Chapter
# defmodule HelloWeb.RoomChannel do
#   use Phoenix.Channel
#
#   def join("room:lobby", _message, socket) do
#     {:ok, socket}
#   end
#   def join("room:" <> _private_room_id, _params, _socket) do
#     {:error, %{reason: "unauthorized"}}
#   end
#
#   def handle_in("new_msg", %{"body" => body}, socket) do
#     broadcast!(socket, "new_msg", %{body: body})
#   end
# end