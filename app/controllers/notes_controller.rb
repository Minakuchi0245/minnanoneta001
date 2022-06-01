class NotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_note, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  #before_action :purchase_nil, only: [:edit, :update]

  def index
    @notes = Note.order('created_at DESC')
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to note_path
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :text, :category_id, :theme_id, :who_id,
                                 :user_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id == @note.user_id
  end

  def set_note
    @note = Note.find(params[:id])
  end

  #def purchase_nil
    #redirect_to root_path if @note.purchase.present?
  #end
end
