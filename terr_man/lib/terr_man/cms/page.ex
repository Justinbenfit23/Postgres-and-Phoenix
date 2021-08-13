defmodule TerrMan.CMS.Page do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do
    field :body, :string
    field :integer, :string
    field :title, :string
    field :views, :string

    timestamps()
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:title, :body, :views, :integer])
    |> validate_required([:title, :body, :views, :integer])
  end
end
