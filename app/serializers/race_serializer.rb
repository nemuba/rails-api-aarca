class RaceSerializer < ActiveModel::Serializer
  attributes :id, :local, :description, :date_race, :created_at, :updated_at

  def date_race
    object.date_race.to_date
  end
end
