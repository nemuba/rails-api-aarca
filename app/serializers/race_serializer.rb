class RaceSerializer < ActiveModel::Serializer
  attributes :id, :local, :description, :date_race, :created_at, :updated_at
end
