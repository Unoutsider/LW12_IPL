require 'rails_helper'

RSpec.describe 'Content', type: :system do
	scenario 'valid input' do
		visit home_path
		expect(find("#loginmsg")).to have_text('To use this service, you need to be signed in!')
	end
end
