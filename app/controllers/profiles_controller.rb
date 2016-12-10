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
      flash[:notice] = "You have created a new profile"
      redirect_to profile_path(@profile)
    else
      # Render the new template
      render :new
    end
  end

  def index
    @profile = Profile.all
  end

  def show
    @profile = current_user.profile
  end

private

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :biography, :picture)
    end




end
