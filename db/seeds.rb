User.create!(email: "example@example.com",
             password: "foobar",
             password_confirmation: "foobar")

Article.create!(title: "First Article", body: "This is a first article.", user_id: 1)