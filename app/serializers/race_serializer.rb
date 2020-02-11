class RaceSerializer < ActiveModel::Serializer
  attributes :id, :local, :description, :date_race, :status, :sponsor_id,  :created_at, :updated_at

  def date_race
    object.date_race.strftime('%d/%m/%Y')
  end
end
