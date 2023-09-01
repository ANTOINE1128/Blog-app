# db/seeds.rb

# Create Users
user1 = User.create(name: 'John Doe', bio: 'Bio for John Doe', posts_counter: 0, photo: 'john_doe.jpg')
user2 = User.create(name: 'Jane Smith', bio: 'Bio for Jane Smith', posts_counter: 0, photo: 'jane_smith.jpg')
  
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
  
  # Create Posts for User 2
  post3 = user2.posts.create(
    title: 'First Post by Jane',
    content: 'Content of the first post by Jane',
    comments_counter: 0,
    likes_counter: 0
  )
  
  post4 = user2.posts.create(
    title: 'Second Post by Jane',
    content: 'Content of the second post by Jane',
    comments_counter: 0,
    likes_counter: 0
  )
  
  # Create Comments for Posts
  comment1 = post1.comments.create(
    text: 'This is the first comment on John\'s post',
    author: user2
  )
  
  comment2 = post1.comments.create(
    text: 'This is the second comment on John\'s post',
    author: user1
  )
  
  comment3 = post2.comments.create(
    text: 'This is a comment on another post by John',
    author: user2
  )
  
  comment4 = post3.comments.create(
    text: 'Jane\'s first post comment',
    author: user1
  )
  
  # Create Likes
like1 = Like.create(author: user1, post: post1)
like2 = Like.create(author: user2, post: post1)
like3 = Like.create(author: user2, post: post2)
like4 = Like.create(author: user1, post: post3)

puts 'Seed data created!'