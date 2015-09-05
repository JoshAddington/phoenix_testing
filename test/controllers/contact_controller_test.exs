defmodule Rocks.ContactControllerTest do
  use ExUnit.Case, async: false
  # use Plug.Test
  use Rocks.ConnCase
  alias Rocks.Contact
  alias Rocks.Repo
  # alias Ecto.Adapters.SQL

  test "/index returns a list of contacts" do
    contacts_as_json =
      %Contact{name: "Gumbo", phone: "(801) 555-5555"}
      |> Repo.insert!
      |> sanitize_map
      |> List.wrap
      |> Poison.encode!

    response = conn(:get, "/api/contacts") |> send_request

    assert response.status == 200
    assert response.resp_body == contacts_as_json
  end

  defp sanitize_map(map) do
    map
    |> Map.drop [:__meta__, :__struct__]
  end

  defp send_request(conn) do
    conn
    |> put_private(:plug_skip_csrf_protection, true)
    |> Rocks.Endpoint.call([])
  end
end
