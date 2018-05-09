User.create!(id: 1,
             email: "example@example.com",
             password: "foobar",
             password_confirmation: "foobar")

Article.create!(id: 1, title: "First Article", body: "This is a first article.", user_id: 1)