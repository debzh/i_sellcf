class ProfilesController < ApplicationController
  def new
    # Creating a new empty Profile object
    @profile= Profile.new
  end

  def create
    # Create profile based on user -> profiles association
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      # Show successful flash message and redirect to profiles list
      redirect_to root_path
    else
      # Render the new template
      render :new
    end
  end

private 

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :biography)
    end




end
