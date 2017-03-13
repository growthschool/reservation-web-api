class Api::V1::TrainsController < ApiController

	def index
		@trains = Train.all
		render :json => {
			:trains => @trains.map{ |train|
				{ :number => train.number,
			  	:train_url => api_v1_train_url(train.number)
				}
			}
		}
	end

	def show
		@train = Train.find_by_number( params[:id] )

		render :json => {
			:number => @train.number,
			:available_seats => @train.available_seats
		}
	end

end