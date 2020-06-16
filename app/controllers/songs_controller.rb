class SongsController < ApplicationController
  
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    if params[:artist_id]
      if @artist = Artist.find_by(id: params[:artist_id])
        @songs = @artist.songs 
      else
        redirect_to artists_path, alert: "Artist not found."
      end
    else
      @songs = Song.all
    end
  end
  
  def show
    if Song.find_by(id: params[:id])
      Song.find_by_id(params[:id])
    else
      redirect_to artist_songs_path, alert: "Song not found."
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.update(song_params)
    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path, notice: "Song deleted."
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end

  def set_song
    @song = Song.find_by_id(params[:id])
  end

end