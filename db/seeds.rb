# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email:'test@test.com',
    password:'testtest'
    )
    
    
    Genre.create!(
        name: "学園",
        is_genres_status: true
        )
        
        Genre.create!(
            name: "ギャグ",
            is_genres_status: true
            )
            
            Genre.create!(
                name: "スポーツ",
                is_genres_status: true
                )
                
                Genre.create!(
                    name: "ホラー",
                    is_genres_status: true
                    )