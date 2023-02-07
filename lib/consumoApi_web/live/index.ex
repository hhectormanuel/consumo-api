defmodule ConsumoApiWeb.Index do
  use ConsumoApiWeb, :live_view
  # alias ConsumoApiWeb.Router.Helpers, as: Routes

  def render(assigns) do
    ~H"""
    <form phx-submit="submit">
      <ul>
        <li>
          <label>Page url or path file</label>
          <input type="text" id="url_or_path" name="url_or_path">
        </li>
        <li>
          <input type="radio" id="url" name="url_file" value="url" checked>
          <label for="url">URL</label><br>
          <input type="radio" id="file" name="url_file" value="file">
          <label for="file">File</label>
        </li>
        <li>
          <button>
            Search
          </button>
        </li>
      </ul>
    </form>

    <%= if @info do %>
      <table>
        <tr>
          <%= for n <- @columns do %>
          <td>
            <%= n %>
          </td>
          <% end %>
        </tr>
        <tr>
          <td>
            2
          </td>
          <td>
            4
          </td>
        </tr>
      </table>
    <% else %>

    <% end %>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, info: nil, columns: nil)}
  end

  def handle_event("submit", %{"url_file" => type, "url_or_path" => url_or_path}, socket) do
    IO.inspect(type)
    IO.inspect(url_or_path)
    cond do
      type == "url" -> redirect(socket, to: "/")
      true -> "mandar a file"
    end
    {:noreply, socket}
  end

end

# Routes.page_url(@socket, :index, [])
