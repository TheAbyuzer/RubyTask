# README

Hi There, 

I'm Mohamed Shawky CS Student At AAST 

i've tried so hard to do your task 

but i wasn't that good with docker so i couldn't dockerize it and i didn't have that much time becuase of my graduation project :( 


* Here is a summery about the RestAPI 

* AUTHENTICATION ENDPOINTS : 
* METHOD: POST   ROUTE: /login  PARAMS:username,password
* METHOD: POST   ROUTE: /register  PARAMS:name,username,password,password_confirmation,image #NOTE : pramater image is not required

* ALL THE FOLLOWING ENDPOINTS REQUIRES AN AUTHENTICATION
* CRUD Routes : 
* METHOD: GET   ROUTE: /posts
* METHOD: GET   ROUTE: /posts/post_id or /posts/me 
* METHOD: POST  ROUTE: /posts  PARAMS:title,body,tags
* METHOD: PUT or PATCH  ROUTE: /posts/post_id  PARAMS:title,body,tags
* METHOD: PUT or PATCH  ROUTE: /posts/post_id/tags  PARAMS:tags
* METHOD: DELETE ROUTE: /posts/post_id

* METHOD: GET   ROUTE: /posts/post_id/comments
* METHOD: POST  ROUTE: /posts/post_id/comments  PARAMS:body
* METHOD: PUT or PATCH  ROUTE: /posts/post_id/comments/commnet_id  PARAMS:body
* METHOD: DELETE ROUTE: /posts/post_id/comments/commnet_id 
