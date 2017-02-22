defmodule ZionMetrics.EventController do
  use ZionMetrics.Web, :controller

  alias ZionMetrics.EventQuery

  def create(conn, %{"body" => event_params}) do
    event = for {key, val} <- event_params, into: %{}, do: {String.to_atom(key), val}
    EventQuery.insert(event)

    json conn, event
  end

  def show(conn, %{"type" => type}) do
    events = EventQuery.from_event_type(type)

    json conn, events
  end
end
