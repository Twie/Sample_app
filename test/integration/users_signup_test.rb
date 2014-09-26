require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test 'invalid signup information' do
	get signup_path
	assert_no_difference 'User.count' do 
	post users_path, user: {name: "", email: "user@invalid", password: "food", password_confirmation: "pizza"}
	end
	assert_template 'users/new'	
	end

	test 'valid signup' do
		get signup_path
		name = 'Test User'
		email = 'test@testing.com'
		password = 'testing123'
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: { name: name, email: email, password: password, password_confirmation: password}
		end
	assert_template 'users/show'
	end
end
