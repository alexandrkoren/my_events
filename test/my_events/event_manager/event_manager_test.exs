defmodule MyEvents.EventManagerTest do
  use MyEvents.DataCase

  alias MyEvents.EventManager

  describe "events" do
    alias MyEvents.EventManager.Event

    @valid_attrs %{city: "some city", description: "some description", event_date: ~D[2010-04-17], location: "some location", name: "some name"}
    @update_attrs %{city: "some updated city", description: "some updated description", event_date: ~D[2011-05-18], location: "some updated location", name: "some updated name"}
    @invalid_attrs %{city: nil, description: nil, event_date: nil, location: nil, name: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> EventManager.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert EventManager.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert EventManager.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = EventManager.create_event(@valid_attrs)
      assert event.city == "some city"
      assert event.description == "some description"
      assert event.event_date == ~D[2010-04-17]
      assert event.location == "some location"
      assert event.name == "some name"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EventManager.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = EventManager.update_event(event, @update_attrs)
      assert event.city == "some updated city"
      assert event.description == "some updated description"
      assert event.event_date == ~D[2011-05-18]
      assert event.location == "some updated location"
      assert event.name == "some updated name"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = EventManager.update_event(event, @invalid_attrs)
      assert event == EventManager.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = EventManager.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> EventManager.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = EventManager.change_event(event)
    end
  end
end
