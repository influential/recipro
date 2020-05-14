--| Deleting a recipe
--  Remove any comments on the recipe
DELETE FROM Comments WHERE recipe_id=:delete_this;
--  Unset ingredients that have that recipe_id set
UPDATE Ingredients SET recipe_id=NULL WHERE recipe_id=:delete_this;
--  Remove recipe from any recipe lists
DELETE FROM Has_recipes WHERE recipe_id=:delete_this;
--  Remove the recipe
DELETE FROM Recipes WHERE recipe_id=:delete_this;

--| Delete a user
--  Set recipes user has authored to NULL author
UPDATE Recipes SET user_id=NULL WHERE user_id=:delete_user;
--  Set comment user to NULL
UPDATE Comments SET user_id=NULL WHERE user_id=:delete_user;
--  Delete has_ingredients
DELETE FROM Has_ingredient WHERE user_id=:delete_user;
--  Delete recipe lists
DELETE FROM Recipe_Lists WHERE user_id=:delete_user;
--  Remove the user
DELETE FROM Users WHERE user_id=:delete_user;
