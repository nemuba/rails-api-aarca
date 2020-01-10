class RaceSerializer < ActiveModel::Serializer
  attributes :id, :local, :description, :date_race, :status, :created_at, :updated_at

  def self.date_race
    object.date_race.strftime('%d/%m/%Y')
  end
end
