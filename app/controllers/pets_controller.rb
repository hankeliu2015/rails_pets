class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.create(pet_params)
    # binding.pry
    # byebug
    # @pet = Pet.create(name: params[:dog][:name])

    if @pet.save
      redirect_to pet_path(@pet)
    else
       render :new
    end
  end

  def index
    @pets = Pet.all
  end

  def show
    set_pet
  end

  def edit
    set_pet
  end

  def update
    set_pet
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end

  end

  private

  def set_pet

    @pet = Pet.find_by(id: params[:id])
    if !@pet
      redirect_to pets_path
    end

  end
  def pet_params
    params.require(:pet).permit(:name, :species, :age)
  end
end
