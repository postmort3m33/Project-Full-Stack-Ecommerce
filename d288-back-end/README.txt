**********************************************************************************************************************
** READ ME ***********************************************************************************************************
**********************************************************************************************************************

D288 Full Stack Project - Joshua Touchstone - 05/07/24

** READ ME FIRST **
Note: All extra notes for each task marked by a dash are mostly extra things that I went back in and fixed. These
        task notes do not always include the actual work done for that task!

**********************************************************************************************************************
Task B: Create your subgroup and project by logging into GitLab using the web link provided and do the following

Commit: 05/07/24 @ 9:00 AM

**********************************************************************************************************************
Task C: Construct four new packages, one for each of the following: controllers, entities, dao, and services.

Commit: 05/07/24 @ 9:15
Commit2: 05/07/24 @ 9:24
    - New Packages did not show in Git because they were empty.

**********************************************************************************************************************
Task D: Write code for the entities package that includes entity classes and the enum designed to match the UML
        diagram.

Commit: 05/07/24 @ 3:40
    - Enum located inside Cart Class

**********************************************************************************************************************
Task E:  Write code for the dao package that includes repository interfaces for the entities that extend JpaRepository
        , and add cross-origin support.

Commit: 05/09/24 @ 4:20
    - Had to also go back and edit class variable names to match up with what Angular was looking for...

**********************************************************************************************************************
Task F: Write code for the services package that includes each of the following:
        •    a purchase data class with a customer cart and a set of cart items
        •    a purchase response data class that contains an order tracking number
        •    a checkout service interface
        •    a checkout service implementation class

Commit: 05/10/24 @
    - Had to go back and add helper methods to Cart and Customer class to add to their collections.

**********************************************************************************************************************
Task G: Write code to include validation to enforce the inputs needed by the Angular front-end.

Commit 05/12/24
    - Annotations added in Customer class.
    - Had to add validation Maven dependency in POM and change to Java 17 for support, when was on 21 previously.

**********************************************************************************************************************
Task H: Write code for the controllers package that includes a REST controller checkout controller class with a
        post mapping to place orders.

Commit 05/12/24 @ 8:30 PM
    - Went back to CheckoutServiceImpl and set it up to save to cartRepository and not customerRepository, (Doing this
      was overwriting my division id's of my customers causing other things to not work).
    - Went back to CheckoutServiceImpl to add functionality to change order status to "ordered"
    - Went back to Country class to match some changed naming conventions from Divisions class
    - Went back to Divisions to follow UML naming conventions and add support for populating Divisions drop down
      menu on the front end (adding another country_id variable)
    - Went back to Customer to match naming convention from the UML and added @NoArgs and @AllArgs Annotations.

**********************************************************************************************************************
Task I: Add five sample customers to the application programmatically.

Commit 05/15/24 2 8:15 AM
    - Went back and Updated cart class to match UML Schema variable names.
    - Went back and updated CartItem class to match UML schema AND to add @JoinTable annotation for excursion_cartitem
      because i changed from having an excursion_cartitem class using a composite key to using a Many-to-Many
      relationship instead and using the @JoinTable annotation
    - Went back and took out use of Customer Repository in CheckoutServiceImpl class
    - Went back and deleted composite key class
    - Went back and updated Country class variables to match UML schema
    - Went back and updated Customer class variables to match UML schema
    - Went back to Division class and changed Customer > Division to uni-directional support NOT bi-directional
      according to the UML Schema
    - Went back to Excursion class and matched variable names to match UML Schema and setup for using a Many-to-Many
      relationship with CartItem class instead of Composite Key
    - Deleted ExcursionCartItem class and Repository class
    - Went back to Purchase class and replaced @Data with @Getter, @Setter, @AllArgsConstructor, and @NoArgsConstructor
    - Went back and did the same thing to the PurchaseResponse class
    - Went back yo Vacation class and made the CartItem > Vacation relationship Uni-directioanl not bi-directional
      according to the UML Schema

**********************************************************************************************************************
Task J : Run your integrated application by adding a customer order for a vacation with two excursions using the
           unmodified Angular front-end. Provide screenshots for the following:

Commit: 05/15/24 @ 8:43 AM
    - Screenshots will be attached to submission.



