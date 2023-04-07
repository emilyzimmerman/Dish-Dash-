class RecipeBlueprint < Blueprinter::Base
    identifier :id
    fields :name, :content, :created_at, :image_path, :user, :meal
end