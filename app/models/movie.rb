class Movie < ActiveRecord::Base

	# attr_accessible :poster_image_url

	mount_uploader :image, ImageUploader
	has_many :reviews

	validates :name,
	presence: true

	validates :director,
	presence: true

	has_many :reviews 

	validates :runtime_in_minutes,
	numericality: { only_integer: true }

	validates :description,
	presence: true

	# validates :poster_image_url,
	# presence: true

	validates :release_date,
	presence: true

	validate :release_date_is_in_the_past

	def review_average
	  # sum = reviews.sum(:rating_out_of_ten) 
	  # return sum/reviews unless sum = 0
	  unless reviews.sum(:rating) == 0
	  	reviews.sum(:rating)/reviews.size
	  else 
	  	return 0
	  end
	end

	# user_params = [:name, :director, :runtime_in_minutes]
	def self.search(params)
		# user_params.each do |key, value|
		# binding.pry
			# where("name LIKE user_params[:name] OR director LIKE user_params[:director]").to_sql
			where("name like ?", "%#{params[:name]}")
			# OR director like ?", "%#{name: params[:name], director: params[:director]}%")
			# binding.pry
	end

	protected
	def release_date_is_in_the_past
		if release_date.present?
			errors.add(:release_date, "should be in the past") if release_date > Date.today
		end
	end

end