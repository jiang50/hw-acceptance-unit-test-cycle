Feature: New Movies Test Cases

  As a movie lover
  So that I can find movies with my favorite director
  I want to include and search on director information for movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: sort movies in increasing order of title
  Given I am on the home page
  When I follow "Title"
  Given I should be on the home page
  Then I should see "Alien" before "Blade Runner"

Scenario: delete movie
  Given I am on the details page for "Star Wars"
  And  I press "Delete"
  Then  I should be on the home page 
  And I should see "Movie 'Star Wars' deleted." 

Scenario: add movie
  Given I am on the home page
  And  I follow "Add new movie"
  Then I am on the new movie page
  When I fill in "Title" with "Yucheng"
  And I select "R" from "Rating"
  And I press "Save Changes"
  Then I should be on the home page
  And I should see "Yucheng was successfully created."

