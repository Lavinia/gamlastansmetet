defmodule Gamlastansmetet.Signup do
  use Gamlastansmetet.Web, :model
  alias Gamlastansmetet.Repo

  schema "signups" do
    field :team_name, :string
    field :phone, :string
    field :email, :string

    timestamps
  end

  @required_fields ~w(team_name)
  @optional_fields ~w(phone email)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:team_name, min: 1)
    |> validate_presence_of_phone_or_email
  end

  @doc """
  Returns the number of signups in the repository.
  """
  def count do
    query = from s in __MODULE__,
      select: count(s.id)
    Repo.one query
  end

  defp validate_presence_of_phone_or_email(changeset = %{valid?: false}), do: changeset
  defp validate_presence_of_phone_or_email(changeset) do
    valid = phone_or_email_present? changeset.changes
    %{changeset | :valid? => valid }
  end

  defp phone_or_email_present?(%{phone: _phone}), do: true
  defp phone_or_email_present?(%{email: _email}), do: true
  defp phone_or_email_present?(_), do: false
end
