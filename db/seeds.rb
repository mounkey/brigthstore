Category.destroy_all
User.destroy_all
Wear.destroy_all

User.create(email: "lfuentes.entergrafic@gmail.com", password: "15051996")
User.create(email:"jpgrover@mounkey.cl", password: "12345678")
User.create(email: "entergr4fic@gmail.com", password: "12345678")
User.create(email: "megalatinvoz@gmail.com", password: "12345678")


Category.create(nombre: "Ropa_Mujer", imagen: "picturesWomanbig.png")
Category.create(nombre: "Ropa_Kids", imagen: "picturesKidssmall.png")
Category.create(nombre: "Ropa_Hombre", imagen: "picturesManbig.png")
Category.create(nombre: "Ropa_Winter", imagen: "picturesWintersmall.png")
Category.create(nombre: "Ofertas", imagen: "picturesSalesmall.png")
Category.create(nombre: "Party", imagen:"picturesPartysmall.png")
