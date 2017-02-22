defmodule ZionMetrics.EventController do
  use ZionMetrics.Web, :controller

  alias ZionMetrics.Event
  alias ZionMetrics.Repo

  def create(conn, %{"event" => event_params}) do
    changeset = Event.changeset(%Event{}, event_params)
    
    case Repo.insert(changeset) do
      {:ok, event} ->
        json conn, true
      {:error, changeset} ->
        json conn, false
    end
  end

  def show(conn, %{"type" => type}) do
    events = from_event_type(type)

    json conn, events
  end

  defp from_event_type(type) do
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
