class SongShow < ActiveRecord::Base
	belongs_to :song
	belongs_to :show
end
