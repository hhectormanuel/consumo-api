defmodule ConsumoApiWeb.ItemView do
  use ConsumoApiWeb, :view
  alias ConsumoApiWeb.ItemView


  def render("index.json", %{items: items}) do
    render_many(items, ItemView, "item.json")
  end

  def render("show.json", %{item: item}) do
    render_one(item, ItemView, "item.json")
  end

  def render("item.json", %{item: item}) do
    item
  end
end
