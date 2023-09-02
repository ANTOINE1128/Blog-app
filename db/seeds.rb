# db/seeds.rb

# Create Users
user1 = User.create(name: 'John Doe', bio: 'Bio for John Doe', posts_counter: 0, photo: 'john_doe.jpg')

  
  # Create Posts for User 1
  post1 = user1.posts.create(
    title: 'First Post by John',
    content: 'Content of the first post by John',
    comments_counter: 0,
    likes_counter: 0
  )
  
  post2 = user1.posts.create(
    title: 'Second Post by John',
    content: 'Content of the second post by John',
    comments_counter: 0,
    likes_counter: 0
  )
 
  
  comment1 = post1.comments.create(
    text: 'This is the second comment on John\'s post',
    author: user1
  )
  
 
  comment2 = post2.comments.create(
    text: 'jhon\'s second post comment',
    author: user1
  )
  
  # Create Likes
like1 = Like.create(author: user1, post: post1)

like2 = Like.create(author: user1, post: post2)

puts 'Seed data created!'