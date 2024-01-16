//aggregation : 

use("restaurant")

db.restaurants.aggregate({$match :{rating : 5}},{$count:"comptage"});

