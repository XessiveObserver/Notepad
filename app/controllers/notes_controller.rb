class NotesController < ApplicationController
  before_action :specific_note, only: [:update, :edit, :destroy]
  def index
    @notes = Note.all.reverse
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    # @note = Note.new
    @note = current_user.notes.build
  end

  def create
    # @note = Note.new(note_params)
    @note = current_user.notes.build(note_params)
    
    if @note.save
      redirect_to @note
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
      
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to notes_path, status: :see_other
  end

  def specific_note
    @note = current_user.notes.find_by(user_id: params[:id])
    redirect_to notes_path, notice: "Not allowed to make changes to this Note" if @notice.nil?
  end

  private
    def note_params
      params.require(:note).permit(:title, :body)
    end
end
