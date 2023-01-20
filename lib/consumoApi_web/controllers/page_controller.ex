defmodule ConsumoApiWeb.PageController do
  use ConsumoApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"texto" => texto}) do
    render(conn, "show.html", texto: texto)
  end
end
