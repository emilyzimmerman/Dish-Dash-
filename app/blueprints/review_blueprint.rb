class ReviewBlueprint < Blueprinter::Base
    identifier :id 
    fields :comment, :user, :recipe
end