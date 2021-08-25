class GamesController < ApplicationController
  rescue_from Exception do |e|
    render json: { error: e.message }, status: :internal_error
  end
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end
  # GET /games/{id}
  def show
    @game = Game.find(params[:id])
    render json: @game, status: :ok
  end

  # POST /games
  def create
    @game = Game.create!(create_params)
    unless @game.nil?
      # Create board
      positions = PositionsGenerationService.generate(@game)
      @game.positions.create!(positions)
    end
    render json: @game, status: :created
  end

  # PUT /games/{id}/positions/{id}
  def update
    @position = Position.find(params[:id])
    @position.update!(update_params)
    @game = Game.find(params[:game_id])
    render json: @game, status: :ok
  end

  private

  def create_params
    params.require(:game).permit(:num_row, :num_column, :num_mine)
  end

  def update_params
    params.require(:position).permit(:game_id, :state, :id)
  end
end
