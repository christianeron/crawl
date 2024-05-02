Rails.application.routes.draw do
  # Routes for the Crawl resource:

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
  root "crawls#index"
end
