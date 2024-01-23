use("demorelation")

db.demorelations.insertOne(
    {
        _id : "123",
        nom : "Michel",
        email : "mc@gmail.com",
        profil : {age : 30, hobbies : ["peintire","sport"] }
    }
)

db.demorelations.find()
