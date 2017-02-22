defmodule ZionMetrics.EventQuery do
  use ZionMetrics.Web, :model
  
  import Ecto.Query
  alias ZionMetrics.Event
  alias ZionMetrics.Repo


  def insert(object) do
    event = %Event{
      project:    object.project,
      version:    object.version,
      brand:      object.brand,
      source:     object.source,
      side:       object.side,
      channel:    object.channel,
      device:     object.device,
      route:      object.route,
      type:       object.type,
      value:      object.value
    }

    Repo.insert(event)
  end

  def from_event_type(type) do
    query = from e in Event,
            where: e.type == ^type,
            select: e 

    Repo.all(query)
    |> Enum.map(fn(e) ->
      %{
        project:    e.project,
        version:    e.version,
        brand:      e.brand,
        source:     e.source,
        side:       e.side,
        channel:    e.channel,
        device:     e.device,
        route:      e.route,
        type:       e.type,
        value:      e.value
      }
    end)
  end
end