class FriendsController < ApplicationController
	before_action :authenticate_user!

	def index
		friends_user = []
		friendships = Friendship.where("recipient_id = ? or sender_id = ?",current_user,current_user)
		for friendship in friendships
			friends_user.push(friendship.recipient)
		end
		@friends = []
		for friend in friends_user[0,5]
			@friends.push(Profile.find_by(user: friend))
		end

		# Clean you and friends TO DO
		@profiles = []
		for profile in Profile.all
			is_friend = false
			for friend in @friends
				if profile.user == friend.user
					is_friend = true
					break
				end
			end
			if (not is_friend) and (profile.user != current_user)
				@profiles.push(profile)
			end
		end
	end

end
