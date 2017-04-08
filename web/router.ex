defmodule Metrics.Router do
  use Metrics.Web, :router

  pipeline :events do
    plug :accepts, ["json"]
  end

  scope "/v1/events", Metrics do
    pipe_through :events

    resources "/events", EventController
    post "/", EventController, :create
    get "/:type", EventController, :show
  end
end
