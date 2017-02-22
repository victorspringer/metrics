defmodule ZionMetrics.Event do
  use ZionMetrics.Web, :model

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
    
    timestamps
  end
end