# README
## Plantr.

### What Problem Will Plantr. solve and Why?
There are many marketplace apps to connect members of the community to sell/exchange objects to each other. Gumtree, for example, has a "Pots and Garden Beds" section however it lacks specificity, only allowing for photos, a title, a description, weather the item is being sold or sought and the price. 

Plantr. will improve user's browsing ability by prompting sellers to list more specific features including; drainage, material, shape and dimensions.

For example, a user views a pot listed by a seller. The photo does not show if there is drainage and is taken on a plain background, so there is nothing to reference size. The user requires a specific size and drainage but likes the style of the seller's listing. The user messages the seller to ask about size and drainage, and the seller could take a day or more to get back to the user, only for the user to find the pot is inappropriate. The seller is disappointed that they have not sold their listing and a day has been wasted for both parties. 

### Deployed app:
<a href="https://damp-anchorage-55875.herokuapp.com/">https://damp-anchorage-55875.herokuapp.com/</a>


### Github repository:
<a href="https://github.com/aes89/Plantr.">https://github.com/aes89/Plantr.</a>

### App Description:
#### Purpose
This app was developed to connect people in the community to buy pots, planters and other containers for growing plants from each other.

#### Functionality/Features

- Users: a user can sign up for an account. This gives them access to the other functions (they can only view the home page without signing in) as well as updating their profile (name, email and password).
- Listings: a user can both make and purchase listings. Once a user has made a listing they can return to it to edit it and delete it. A user can view a list of all of their listings, as well as browse through all available listings (listing summaries are displayed on the "browse" page) and view a listing's specifics on the listing's dedicated page.
- Comments: users can leave comments on a specific listing's page. Only the seller (who created the listing) can remove comments, in case they are inappropriate or irrelevant (e.g. another user may make repeated requests to lower the price).
- Payments: a user can purchase a listing which is supported by Stripe. THey click "buy now" and are redirected to Stripe, who manages the payment. Once complete they are redirected back to the app, the listing is marked as "unavailable" and is no longer shown on the "browse" page.
- Transactions: users can view the listings that they have bought and sold on a "transactions" page.

#### Sitemap
Planned site map:

<img src ="resources/sitemap/initial_site_map.jpeg" alt="Initial Site Map for Plantr. App" height="500"/>

Final site map:

<img src ="resources/sitemap/final_site_map.jpeg" alt="Final Site Map for Plantr. App" height="500"/>

#### Screenshots
Click images to view full size.
|<img src="resources/screenshots/home_notauthenticated.png" height = "200" />|<img src="resources/screenshots/login.png" height = "200" />|<img src="resources/screenshots/signup.png" height = "200" />|<img src="resources/screenshots/home_authenticated.png" height = "200" />|
|---|---|---|---|
|Home Page - Not Authenticated|Log In|Sign Up|Home Page - Authenticated|
|<img src="resources/screenshots/edit_profile.png" height = "200" />|<img src="resources/screenshots/edit_profile.png" height = "200" />|<img src="resources/screenshots/users_transactions.png" height = "200" />|<img src="resources/screenshots/users_listings.png" height = "200" />|<img src="resources/screenshots/browse_listings.png" height = "200" />|
|Edit Profile|User's Transactions|All User's Listings|Browse All Listings|
|<img src="resources/screenshots/new_listing.png" height = "200" />|<img src="resources/screenshots/edit_listing.png" height = "200" />|<img src="resources/screenshots/specific_listing.png" height = "200" />|<img src="resources/screenshots/after_payment.png" height = "200" />|
|Form for New Listing|Form for Edit Listing|View a Specific Listing - Comments Under the Listing (Header Present but Not Shown)|Successful Payment Page|

#### Target Audience
This app is designed for anyone looking to purchase or sell pots, planters or other containers for growing plants to other people in the community. Current features are designed for an individual selling a unique, second hand item rather than businesses/mass produced items, but this could be expanded on in the future.

#### Tech Stack
##### Front-end
- HTML
- CSS
- SCSS
- Ruby 2.6.3
- Ruby on Rails 6.0.3
- Stripe
- Postgres
- AWS 
- 
  
##### Database
- Postgresql

##### Deployment
- Heroku

##### Utilities
- Stripe
- Devise
- AWS S3

##### DevOps
- Git
- Github
- VS Code
- Bundler
- Figma
- Lucidchart

### User Stories

As a user, from the home page I can register for an account by clicking "sign up". I will be taken to the registration page where I can enter my name, email and password.

As a user I can log out from any page using the navigation bar "sign out" link. I will be redirected to the home page.

As a buyer, I can browse through listings with a photo and summarised information.

As a buyer, I can view an individual listing and see a photo and detailed information of the listing.

As a user, I can view and individual listing and comment on it to ask questions/reply to questions.

As a buyer, I can purchase a listing by clicking "buy now" on a listing's individual page.

As a user, I can log on from the home page and navigate to my profile. 

As a user, from my profile page I can update my profile details and delete my profile. 

As a seller, from the home page dashboard section, I can navigate to a collection of my listings. From here, I can view/edit/delete my listings.

As a user looking to sell, from my listing's edit page, I can update the specifications of my listing or delete my listing.

As a user looking to sell, I can comment on my own listing's page and delete other user's comments.

As a user, from the homepage dashboard section I can navigate to a list of bought and sold listings. 

### Wire Frames
| | Mobile | Web/Tablet |
|:---:|:---:|:---:|
|Home Page| <img src="resources/wireframes/home_noauth_mob.png" />|<img src="resources/wireframes/home_noauth_web.png" />|
|Home Page - Logged In| <img src="resources/wireframes/home_auth_mob.png" />|<img src="resources/wireframes/home_auth_web.png" />|
|Sign Up Page|<img src="resources/wireframes/signup_mob.png" />|<img src="resources/wireframes/signup_web.png" />|
|Login Page|<img src="resources/wireframes/login_mob.png" />|<img src="resources/wireframes/login_web.png" />|
|Edit Profile|<img src="resources/wireframes/edit_profile_mob.png" />|<img src="resources/wireframes/edit_profile_web.png" />|
|Individual Listing Page|<img src="resources/wireframes/listing_mob.png" />|<img src="resources/wireframes/listing_web.png" />|



### ERD
Planned ERD:

<img src="resources/ERD/ERD_initial.jpeg" height = "500" />

Implemented ERD:

<img src="resources/ERD/ERD_final.jpeg" height = "500" />

### High-Level Components and Model Relationships
#### Models

##### User
Most aspects of the User functions were handles with the Devise Gem. Devise has many inbuilt features that are established in the model such as authenticating users, registering users, validating users and remembering users.

###### Relationships:
    has_many :owned_listings, :class_name => 'Listing', :foreign_key => 'seller_id' 

    has_many :bought_listings, :class_name => 'Listing', :foreign_key => 'buyer_id'

  This allows a user id to act both as a buyer and a seller id and reduces duplication withing the schema. 
  Previously, listings were dependent on their seller (i.e. when a user's account was deleted all of their listings were deleted), and this will need to be reconfigured to the seller id.

##### Listing
The listing model works to validate input when making a listing. Many features of the listings have set values which are defined here (e.g. a user cannot type in anything for "shape", they are given the options "other", "round" or "square") using enums. 

###### Relationships:
    belongs_to :seller, :class_name => 'User'
    A listing is associated with a user id, that is the "seller".
    has_one :buyer, :class_name => 'User' 
    A listing can only be associated with one user id, that is the "buyer".
    has_one_attached :picture
    Allows for one image to be uploaded and attached to the listing id. Pictures were initially stores in active records, but were moved to AWS
    has_many :comments, dependent: :destroy
    Comments associated with this listing are deleted with the listing.

##### Comment
    Comments have one author (user id) and one listing (listing id) that they are associated with. This association allows the comments to be displayed on the correct listing and the author's name to be automatically displayed.

###### Relationships:
    belongs_to :listing
    belongs_to :user

#### Controllers
##### Application Controller
The application controller is populated with code generated by the Devise gem. It allows Devise to create, update and delete users (names, emails, passwords) in Users table. Devise manages all authentication in Plantr (ensuring a user is logged in/verified to access functions like listings and purchasing.)

##### Page Controller
This was initially created to support the home page (moved to listing controller) and a future feature that will display a generic "error" page. Currently it does not have a function.

##### Listings Controller
The listings controller manages all of the pages concerned with listings. It specifies that some actions need to be taken before the pages are loaded (e.g. authenticating a user before they can see the page, excluding the home page).
It defines the logic for each page such as creating, updating and deleting a listing. It also defines variables for views to work with (e.g. on the "index"/browse page "@listing" refers to all listings).
The "show" method also contains the code to support Stripe payments, as the "buy now" button is on the "Show" page, and this is where the "show" page receives it's logic from. 

##### Comments Controller
The comments controller holds the logic to create and destroy comments, as these are the only functions comments have. Before these methods are accessed this controller verifies that a user is signed in, and checks their user name.
The comments routes are nested within the listing routes, which allows for the comment methods to work with the listing methods. 

##### Payments Controller
This controller mainly manages the returning webhook from stripe. Once it has been received it updates the listing with the buyer id (the user id that just made the payment) and changes the listing to "available => false".
This  controller does not utilise Devise's user authentication as it interferes with the webhook function.

#### Views
##### Page Views
This folder contains one basic error page, but it is not currently in use. In the future this generic, error page would be displayed for any error (e.g. 404 page not found).

##### Listing Views
This folder contains a page for each method in the Listing Controller (not private), as well as a partial for the form to make a new listing and edit a current listing. The same form is rendered each time, but rails recognizes from the file names ("new" and "edit") how the form is intended to behave. There is minimal logic in the views, for example, the home page displays the latest created listing ("listing.last") and conditional statements ("available => false" listings are not shown on the "index"/browse page).

##### Layouts Views
This folder contains the file that provides the heading and general layout fo each page. 

##### Devise Views
By default, Devise does not provide access to their views. These were installed to add a "name" field to the registrations (new and edit) pages which were added to the default Users table.

##### Comments Views
The comments views contains a form partial that is set up similarly to the listings form and partials. They are rendered on the listings page.


##### Partials Views
This contains a partial for the navbar, which is rendered on layouts/application and then rendered on each page.

##### Payments Views
The payments views only contains a successful payment page, it only serves to let the user know that the payment has been processed when they are redirected back from Stripe. 

### Third Party Services

#### Devise
User features were implemented using the Devise gem.

#### AWS
Plantr. uses amazon web services to host images that users upload for their listings.

#### Stripe
Plantr.'s payments are handled by Stripe, which allows for securely managed payments. Stripe returns a webhook that updates the listing to "unavailable" and updates the "buyer id" to the id of the user that made the payment. 

##### Heroku
Plantr. is hosted by Heroku. Heroku supports the webhook from Stripe as well as the database; PostreSQL. 


### Database Schema Design and Relations
<img src="resources/schema/schema1.png" width="450" />
<img src="resources/schema/schema2.png" width="450" />

#### Users
Users have relations with both of the other tables. The relation with comments is simple: a user can have many comments. The relation with listings is slightly more complex. A user can have many listings, and the user_id functions as 2 foreign key values for the listings (defined in the listing model).

#### Comments
Comments are associated with a user (a comment can only have one author/user id) and a listing (a comment can only be associated with one listing id). A comment display's a user's name, which is not the foreign key, 

#### Listings
Listings can have many comments, and have to relations with users. When a listing is created by a user, their id becomes the "seller id". When a user buys a listing, their id becomes the "buyer id". Listings also have a relation with a photo, which is hosted through AWS. Listings can only have one photo. 

### Tasks Allocated and Tracked
Tasks were tracked through <a href="https://trello.com">Trello</a> using colour coding and check lists. Tasks were assigned to cards, most with checklists on the cards to break down the task. The cards were also colour coded to:
- differentiate between code based (blue) and documentation based (purple) tasks.
- indicate required tasks (red) and optional/"nice to have" elements (orange).
- show what tasks relate to features of the app (pink).
- show what tasks need to be repeated daily (yellow).
- show what tasks were completed (green).
- show what tasks I am stuck on (teal).
- show what tasks needed to be reviewed before submitting (black).

Cards could also be organised into different columns/lists:
- To Do.
- In Progress.
- To Test.
- Complete.

Trello also allows for cards to be assigned to specific team members, however this project was developed by one person so this feature was not utilised.

|Early Trello Board|  | |
|---|:---:|:---:|
|<img src="resources/trello/Trello_22072020_1.png" alt="Trello board, day 1, image 1 of 3" width="200" height ="125" />|<img src="resources/trello/Trello_22072020_2.png" alt="Trello board, day 1, image 2 of 3" width="200" height ="125" />|<img src="resources/trello/Trello_22072020_3.png" alt="Trello board, day 1, image 3 of 3" width="200" height ="125" />|
|Part 1|Part 2|Part 3|
|Checklist| | |
|<img src="resources/trello/Trello_22072020_checklist.png" alt="Trello checklist example" width="200" height ="150" />| | |

Click on the screen shots to view them full size.