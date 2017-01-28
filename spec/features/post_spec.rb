require 'rails_helper'
# creates a user and log them in--------------------------------------------------------------------
describe 'navigate' do
  let(:user) {FactoryGirl.create(:user) }
  
  let(:post) do
    Post.create(date: Date.today, rationale: "Rationale", user_id: user.id, overtime_request: 3.5)
  end
  
  before do
    login_as(user, :scope => :user)
  end
# --------------go to posts/index and make sure its there--------------------------------------------------------------------
  describe 'index' do
    before do
      visit posts_path
    end

  	it 'can be reached successfully' do
  		expect(page.status_code).to eq(200)
  	end
# check for <h1> that says Posts--------------------------------------------------------------------- 
  	it 'has a title of Posts' do
  		expect(page).to have_content(/Posts/)
  	end
# check for posts that has content that says Rationale|content---------------------------------------
    it 'has a list of posts' do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end
    
    # other_user is created and creates a post, but user1 is signed in so you shouldn't see other_user's post
     it 'has a scope so that only post creators can see their posts' do
      other_user = User.create(first_name: 'Non', 
                              last_name: 'Authorized', 
                              email: "nonauth@example.com", 
                              password: "asdfasdf", 
                              password_confirmation: "asdfasdf", 
                              phone: "5555555555")
      post_from_other_user = Post.create(date: Date.today, rationale: "This post shouldn't be seen", user_id: other_user.id, overtime_request: 3.5)

      visit posts_path

      expect(page).to_not have_content(/This post shouldn't be seen/)
    end
  end

# in the root_path, click the button with the id: "new_post_from_nav" and check it's there
  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path

      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

# a posts a user ceated can be deleted by clicking on the button with id: "delete_post_#{@post.id}_from_index"
  describe 'delete' do
    it 'can be deleted' do
      logout(:user)
      delete_user = FactoryGirl.create(:user)
      login_as(delete_user, :scope => :user)
      post_to_delete = Post.create(date: Date.today, rationale: "delete me", user_id: delete_user.id, overtime_request: 3.5)
      visit posts_path

      click_link("delete_post_#{post_to_delete.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

#check to see if post/new is there------------------------------------------------------
  describe 'creation' do
  	before do
  		visit new_post_path
  	end

  	it 'has a new form that can be reached' do
  		expect(page.status_code).to eq(200)
  	end

#fill in data to check if it's working-------------------------------------------------
  	it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      fill_in 'post[overtime_request]', with: 4.5
  
# show page should contain content of "Some rationale"
      expect { click_on "Save" }.to change(Post, :count).by(1) 
  	end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      fill_in 'post[overtime_request]', with: 4.5
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

# @edit_user is another user for testing edits, a user and post are created
# the post the @edit_user is viewed and the rationale is chaged to "Edited content"
  describe 'edit' do
    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"
# show page should now show the new rationale as "Edited content"
      expect(page).to have_content("Edited content")
    end

#another user try to edit the same post but since user.id is != (not equal) is redirected to root_path
    it 'cannot be edited by a non authorized user' do
      logout(:user)
      other_user = FactoryGirl.create(:other_user)
      login_as(other_user, :scope => :user)

      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end
end