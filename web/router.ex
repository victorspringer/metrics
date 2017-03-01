defmodule ZionMetrics.Router do
  use ZionMetrics.Web, :router

  pipeline :events do
    plug :accepts, ["json"]
  end

  scope "/v1/events", ZionMetrics do
    pipe_through :events

    resources "/events", EventController
    post "/", EventController, :create
    get "/:type", EventController, :show
  end
end
