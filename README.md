## Bookmark manager

### To set up database:

  1 Connect to psql
  2 Create the database using the psql command CREATE DATABASE bookmark_manager;
  3 Connect to the database using the pqsl command \c bookmark_manager;
  4 Run the query we have saved in the file 01_create_bookmarks_table.sql


### User stories

As a user
So that i can see my favourite websites
I would like to see a display of bookmarks

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

| Object        | Method      |
| -----------   | ----------- |
| Bookmark      | Show Bookmarks|
| Bookmark list |             |


### Domain model
![image](https://user-images.githubusercontent.com/95698256/158204600-a6ab93a7-d177-406a-90da-c850e6bc3bb4.png)
