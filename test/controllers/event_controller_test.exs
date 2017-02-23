defmodule EventControllerTest do
    use ExUnit.Case, async: true
    use Plug.Test
    alias ZionMetrics.Router
    alias ZionMetrics.Event

    setup do
        :ok = Ecto.Adapters.SQL.Sandbox.checkout(ZionMetrics.Repo)
        Ecto.Adapters.SQL.Sandbox.mode(ZionMetrics.Repo, {:shared, self()})
        :ok
    end

    @opts Router.init([])
    test 'listing aggregation:click events data' do
        conn = conn(:get, "/events/aggregation:click")
        response = Router.call(conn, @opts)
        assert response.status == 200
    end

    @valid_attrs %{
        project:  "zion",
        version:  "dev",
        brand:    "americanas",
        source:   "teste",
        side:     "local",
        channel:  "channel",
        device:   "mobile",
        route:    "/teste",
        type:     "aggregation:click",
        value:    "1"
    }
    @invalid_attrs %{bar: "foo", value: 1}
    
    test "changeset with valid attributes" do
        changeset = Event.changeset(%Event{}, @valid_attrs)
        assert changeset.valid?
    end

    test "changeset with invalid attributes" do
        changeset = Event.changeset(%Event{}, @invalid_attrs)
        refute changeset.valid?
    end
end