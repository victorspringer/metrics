defmodule ZionMetrics.EventController do
  use ZionMetrics.Web, :controller

  def create(conn, %{"event" => event_params}) do
    changeset = Event.changeset(%Event{}, event_params)
    
    case Repo.insert(changeset) do
      {:ok, event} ->
        json conn, true
      {:error, error} ->
        json conn, false
    end
  end

  def show(conn, %{"type" => type}) do
    query = from e in Event,
            where: e.type == ^type,
            select: e

    events = Repo.all(query)
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

    json conn, events
  end
end
