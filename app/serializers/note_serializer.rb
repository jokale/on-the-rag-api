class NoteSerializer < ActiveModel::Serializer
    attributes :title, :body, :date, :user_id
    belongs_to :user

    def date
        object.date.strftime('%m/%d/%Y %I:%M%p')
      end
      
  end