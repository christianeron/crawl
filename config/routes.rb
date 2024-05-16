Rails.application.routes.draw do
  # Routes for current user
  get("/my_crawls", { :controller => "crawls", :action => "my_crawls" })
  
  # Routes for current user
  get("/user/:path_id", { :controller => "crawls", :action => "user_crawls" })
  
  # Routes for the Category resource:

  # CREATE
  post("/insert_category", { :controller => "categories", :action => "create" })
          
  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  
  get("/categories/:path_id", { :controller => "categories", :action => "show" })
  
  # UPDATE
  
  post("/modify_category/:path_id", { :controller => "categories", :action => "update" })
  
  # DELETE
  get("/delete_category/:path_id", { :controller => "categories", :action => "destroy" })

  #------------------------------

  # Routes for the Tag resource:

  # CREATE
  post("/insert_tag", { :controller => "tags", :action => "create" })
          
  # READ
  get("/tags", { :controller => "tags", :action => "index" })
  
  get("/tags/:path_id", { :controller => "tags", :action => "show" })
  
  # UPDATE
  
  post("/modify_tag/:path_id", { :controller => "tags", :action => "update" })
  
  # DELETE
  get("/delete_tag/:path_id", { :controller => "tags", :action => "destroy" })

  #------------------------------

  # Routes for the Visit comment resource:

  # CREATE
  post("/insert_visit_comment", { :controller => "visit_comments", :action => "create" })
          
  # READ
  get("/visit_comments", { :controller => "visit_comments", :action => "index" })
  
  get("/visit_comments/:path_id", { :controller => "visit_comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_visit_comment/:path_id", { :controller => "visit_comments", :action => "update" })
  
  # DELETE
  get("/delete_visit_comment/:path_id", { :controller => "visit_comments", :action => "destroy" })

  #------------------------------

  # Routes for the Stop comment resource:

  # CREATE
  post("/insert_stop_comment", { :controller => "stop_comments", :action => "create" })
          
  # READ
  get("/stop_comments", { :controller => "stop_comments", :action => "index" })
  
  get("/stop_comments/:path_id", { :controller => "stop_comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_stop_comment/:path_id", { :controller => "stop_comments", :action => "update" })
  
  # DELETE
  get("/delete_stop_comment/:path_id", { :controller => "stop_comments", :action => "destroy" })

  #------------------------------

  # Routes for the Visit resource:

  # CREATE
  post("/insert_visit", { :controller => "visits", :action => "create" })
          
  # READ
  get("/visits", { :controller => "visits", :action => "index" })
  
  get("/visits/:path_id", { :controller => "visits", :action => "show" })
  
  # UPDATE
  
  post("/modify_visit/:path_id", { :controller => "visits", :action => "update" })
  
  # DELETE
  get("/delete_visit/:path_id", { :controller => "visits", :action => "destroy" })

  #------------------------------

  # Routes for the Bookmark resource:

  # CREATE
  post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
          
  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the Location resource:

  # CREATE
  post("/insert_location", { :controller => "locations", :action => "create" })
          
  # READ
  get("/locations", { :controller => "locations", :action => "index" })
  
  get("/locations/:path_id", { :controller => "locations", :action => "show" })
  
  # UPDATE
  
  post("/modify_location/:path_id", { :controller => "locations", :action => "update" })
  
  # DELETE
  get("/delete_location/:path_id", { :controller => "locations", :action => "destroy" })

  #------------------------------

  # Routes for the Stop resource:

  # CREATE
  post("/insert_stop", { :controller => "stops", :action => "create" })
          
  # READ
  get("/stops", { :controller => "stops", :action => "index" })
  
  get("/stops/:path_id", { :controller => "stops", :action => "show" })
  
  # UPDATE
  
  post("/modify_stop", { :controller => "stops", :action => "update" })
  post("/modify_stop_order/:path_id", { :controller => "stops", :action => "rearrange" })
  
  # DELETE
  get("/delete_stop/:path_id", { :controller => "stops", :action => "destroy" })

  #------------------------------

  # Routes for the Experience resource:

  # CREATE
  post("/insert_experience", { :controller => "experiences", :action => "create" })
          
  # READ
  get("/experiences", { :controller => "experiences", :action => "index" })
  
  get("/experiences/:path_id", { :controller => "experiences", :action => "show" })
  
  # UPDATE
  
  post("/modify_experience/:path_id", { :controller => "experiences", :action => "update" })
  
  # DELETE
  get("/delete_experience/:path_id", { :controller => "experiences", :action => "destroy" })

  #------------------------------

  # Routes for the Crawl resource:
  root to: "crawls#index"
  
  # CREATE
  post("/insert_crawl", { :controller => "crawls", :action => "create" })
          
  # READ
  get("/crawls", { :controller => "crawls", :action => "index" })
  
  get("/crawls/:path_id", { :controller => "crawls", :action => "show" })
  
  
  # UPDATE
  
  post("/modify_crawl/:path_id", { :controller => "crawls", :action => "update" })
  
  # DELETE
  get("/delete_crawl/:path_id", { :controller => "crawls", :action => "destroy" })

  #------------------------------

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
