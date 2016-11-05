class RegistrationsController < Devise::RegistrationsController#after creating this, I need to go to routes.rb and declare registration controller, i.e, registrations => 'registrations'
	protected
		def update_resource(resource, params)
			resource.update_without_password(params)
		end
end