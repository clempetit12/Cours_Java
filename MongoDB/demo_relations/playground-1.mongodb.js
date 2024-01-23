use("demorelation")

/* db.demorelations.insertOne(
    {
        _id : "123",
        nom : "Michel",
        email : "mc@gmail.com",
        profil : {age : 30, hobbies : ["peintire","sport"] }
    }
) */

/* db.demorelations.find() */

/* db.demorelations.insertOne(
  {
      _id : "12345",
      nom : "paul",
      email : "mc@gmail.com",
      profil_Id : ObjectId ("65a7e011c69b01266c3b0123") }
  
)
 */
/*  db.profil.insertOne({age : 45, hobbies : ["danse","tennis"] })  */

/* db.profil.find() */

/* db.profil.aggregate(
  [{$lookup : 
    {from : "demorelations", 
    localField : "_id",
  foreignField : "profil_Id",
as : "demorelations"}},{$match : {_id : ObjectId ("65a7e011c69b01266c3b0123")}}]
  )

  db.demorelations.aggregate(
    [{$lookup : 
      {from : "profil", 
      localField : "profil_Id",
    foreignField : "_id",
  as : "profil"}},{$match : {_id :"12345"}}]
    )
 */

  /*   db.utilisateur.insertOne({
      name : "Jean",
      age : 40
    })
 */
  

/*     db.adresse.insertOne({
      street : "rue des fleurs",
      number : 46,
      city : "Lille",
      utilisateur_id : ObjectId("65a7e3e58c1d5a6a1bf4e4dc")
    }) */
//OneToOne

/*     db.utilisateur.find()
    db.adresse.find(); */

/*     db.utilisateur.aggregate([
      {$lookup: {
        from: "adresse",
        localField: "_id",
        foreignField: "utilisateur_id",
        as: "adresse"
      }},
      {
        $project: {
          "adresse._id" : 0,
          "adresse.utilisateur_id" :0
        }
      }
    
    ])
 */

    //OneToMany

/*     db.books.insertMany(
      [
        {
          name:"hello",

        },
        {
          name :"world"
        }
      ]
    )
    db.authors.insertOne  ({
      name:"Maximus",
      books: [ObjectId("65a7eee63cebb07273fc065e"),ObjectId("65a7eee63cebb07273fc065f")]
    }) */

    db.authors.aggregate([
      {$lookup: {
        from: "books",
        localField: "books",
        foreignField: "_id",
        as: "books"
      }}
    
    ])