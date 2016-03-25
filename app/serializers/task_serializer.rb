class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :date_due
end
