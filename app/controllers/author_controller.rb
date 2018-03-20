class AuthorController < ApplicationController
	before_action :authenticate_author!, except: [:index, :show]
end
