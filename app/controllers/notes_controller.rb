class NotesController < ApplicationController
  
    def index
      @notes = Note.all
      render json: @notes
    end
  
    def show
      @note = Note.find(params[:id])
      render json: @note
        end
  
    def create
      @note = Note.new(note_params)
      if @note.save
        render json: @note
      else
        render json: { error: 'Error creating a note ' }
      end
    end
  
    def update
      if @note.update(note_params)
        render json: @note
      else
        render json: @note.errors, status: :unprocessable_entity
        end
    end
  
    def destroy
      @note.destroy
    end
  
    private
  
    # def set_note
    #   @note = note.find(params[:id])
    #   end
  
    def note_params
      params.require(:note).permit(:title, :body, :date, :user_id)
    end
  end
  