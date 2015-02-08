class FriendsController < ApplicationController

	def index
		@friends = []

		friendships = Friendship.where({sender: current_user})
		for friendship in friendships
			@friends.push(friendship.recipient)
		end

		friendships = Friendship.where({recipient: current_user})
		for friendship in friendships
			@friends.push(friendship.sender)
		end

		@profiles = []
		for friend in @friends
			@profiles.push(Profile.find_by(user: friend))
		end

	end

end
