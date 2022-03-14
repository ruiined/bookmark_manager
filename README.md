## Bookmark manager

### User stories

As a user
So that i can see my favourite websites
I would like to see a display of bookmarks

| Object        | Method      |
| -----------   | ----------- |
| Bookmark      | Show Bookmarks|
| Bookmark list |             |

+-----------+         +--------+
| HeadCount +--flip-->+  Coin  |
+-----------+         +--------+


### Client                    Controller                   Model                      View

+----------+              +-----------+                +-----------+             
|          |              |           +-----.all------>+           |
|          +-get request->+           +<-\[bookmarks]--+ Bookmarks |
|/bookmarks|              |  app      |                +-----------+            +---------------+
|          |              |           +--------------\[bookmarks]-------------->+               |
|          +<--response---+           |                                         | erb bookmarks |   
+----------+              +-----------+<-------html-----------------------------+---------------+