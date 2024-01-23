use ("Restaurant")

//db.restaurants.find()
//db.restaurants.aggregate({$match : {rating : 5}},{$count:"comptage"})
db.restaurants.aggregate([
    {$group: {_id : "$type_of_food", count : { $sum : 1}}},
    {$match: {
      count : {$gt:10}
    }},
    {$sort : {count : -1}}
])

