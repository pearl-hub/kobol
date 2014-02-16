
#  rails


## install rails and heroku

Install rails app:
`rails new first_app`

Best way to install an app (choose the dbms and delete the test folder):
`rails new first_app --database postgresql -T`

To install the gems in Gemfile:
`bundle install`


To execute the server:
`rails server`


Deploying with heroku:
*  Install heroku:
`gem install heroku`

*  Create SSH Keys:
`ssh-keygen`

*  Load keys to heroku:
`heroku keys:add`

* Create the place to deploy:
`heroku  create`

* Deployment to heroku:
`git push heroku master`

* To open the browser with the right url:
`heroku open`


Other stuff with heroku:
*  Rename application:
`heroku rename other_app`


Open the console without making any changing:
`rails console --sandbox`



## generate code for model and controller


`rails generate model User name:string email:string`

Generate the Users controller with new action:
`rails generate controller Users new`


`rails integration_test layout_links`

To create the files for rspec:
`rails generate rspec:install`


Create a new empty migration:
`rails generate migration add_email_uniqueness_index`


Generate the controller, route, model and view:
`rails generate scaffold User name:string email:string`



## rake actions


`rake db:migrate`


`rake db:create`

Create a db test:
`rake db:test:prepare`

Add a column to a model:
`rails generate migration add_password_to_users encrypt_password:string`

Delete all the record from the dev db:
`rake db:reset`



## ActiveRecord

Defining a model:



class Movie < ActiveRecord::Base
end

-  To create an ActiveRecord object
movie = Movie.new(:title => 'Help', :rating => '5')
-  or
movie = Movie.new
movie.title = 'Help'; movie.rating = '5'




Create:



movie.save -  or movie.save! but throw an exception
movie.create -  combines .new and .save
-  Ask if an object is not saved
movie.id == nil
-  or
movie.new_record?==true




Read:



Movie.where("rating = '5'")
Movie.where("release_date < :cutoff and rating = :rating,
:rating => '5', :cutoff => '1.year.ago')

Movie.find(3) -  throw exception if not found
Movie.find_by_id(3) -  nil if not found

-  Auto generated methods
Movie.find_all_by_rating('5')
Movie.find_by_rating('5')

-  Get first, last and all
Movie.first
Movie.last
Movie.all




Update:



m = Movie.find_by_title('Help')
m.update_attributes(:release_date => '2011-Aug-10')
-  or
m.relase_date = '2011-Aug-10'
m.save

-  To get the original saved information use reload
m.release_date = '23423'
m.reload.relase_date  -  it gives '2011-Aug-10'





Delete:



movie.destroy




Validation:



-  in the model:
vlaidates :name, :presence => true

-  Checks whether is valid according to the constraints
m.valid?
-  and the errors
m.errors.full_messages







## debugging

In view:


debug(@movie)
@movie.inspect


or with ERB:



<%= debug(params) if Rails.env.development? %>



In controller:
Use the logger:

logger.debug(@movie.inspect)



Debugger:
Put "debugger" in controller code and then:

`rails server --debugger`

That will stop the execution and open the debugger.
To decide what environment use:
`rails server --environment production`




## flash and session

flash[] persists up to the end of next request.



flash[:notice]     -  for information
flash[:warning]    -  for errors




session[] persists forever. to reset the session reset_session.
or

session.delete(:some_key)







