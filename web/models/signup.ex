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
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:team_name, min: 1)
    |> validate_presence_of_phone_or_email(params)
  end

  @doc """
  Returns the number of signups in the repository.
  """
  def count do
    query = from s in __MODULE__,
      select: count(s.id)
    Repo.one query
  end

  defp validate_presence_of_phone_or_email(changeset, :empty), do: changeset
  defp validate_presence_of_phone_or_email(changeset, _) do
    changeset.changes
    |> phone_or_email_present?
    |> update_changeset(changeset)
  end

  defp update_changeset(true, changeset), do: changeset
  defp update_changeset(false, changeset) do
    %{changeset |
      :valid? => false,
      :errors => [{:phone, "can't be empty"}, {:email, "can't be empty"} | changeset.errors]
    }
  end

  defp phone_or_email_present?(%{phone: phone, email: email}) do
    !(empty?(phone) && empty?(email))
  end
  defp phone_or_email_present?(%{phone: phone}), do: !empty?(phone)
  defp phone_or_email_present?(%{email: email}), do: !empty?(email)
  defp phone_or_email_present?(_), do: false

  defp empty?(string) when is_binary(string) do
    String.strip(string) == ""
  end
end
