defmodule Metrics.Event do
  use Metrics.Web, :model

  schema "events" do
    field :project
    field :version
    field :brand
    field :source
    field :side
    field :channel
    field :device
    field :route
    field :type
    field :value
    
    timestamps()
  end

  def changeset(event, params \\ %{}) do
    event
    |> cast(params, [:project, :version, :brand, :source, :side, :channel, :device, :route, :type, :value])
  end
end