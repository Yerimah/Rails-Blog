require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations For the Comment model' do
    before(:each) do
      @user = User.new(name: 'Daniel', photo: 'image_link', bio: 'Developer from Nigeria')
      @post = Post.new(author: @user, title: 'My title', text: 'My text', comments_counter: 0, likes_counter: 0)
      @comment = Comment.new(text: 'First comment', author_id: @user.id, post_id: @post.id)
    end

    it 'if title is present' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'if author_id is integer' do
      @comment.author_id = 'string'
      expect(@comment).to_not be_valid
    end

    it 'if post_id is integer' do
      @comment.post_id = 'string'
      expect(@comment).to_not be_valid
    end

    it 'if comment counter is updated' do
        expect(@post.comments_counter).to_not eq 4
    end
  end
end
