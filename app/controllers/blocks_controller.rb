class BlocksController < ApplicationController 
	def show 
		@block = block.find params[:id]
		render json: @block, include: "**"
	end 

	def update 
		@block = Block.find params[:id]
		@block.update block_params 
		broadcast_to_game @block.game
		render json: {status: 200}
	end 

	private 

		def block_params
			params.require(:block).permit(:row,:column,:game_id,:nought)
		end 
end 