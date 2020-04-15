class CommunitiesController < ApplicationController
  def new
    @community = Community.new
    
    @categories = Category.all
    
    @subcategories1 = Subcategory.where(category_id: 1)
    @sub1 = '"---"'
    @subcategories1.each do |sub|
      item = ',"' + sub.name + '"'
      @sub1 = @sub1 + item
    end
      
    @subcategories2 = Subcategory.where(category_id: 2)
    @sub2 = '"---"'
    @subcategories2.each do |sub|
      item = ',"' + sub.name + '"'
      @sub2 = @sub2 + item
    end
    
    @subcategories3 = Subcategory.where(category_id: 3)
    @sub3 = '"---"'
    @subcategories3.each do |sub|
      item = ',"' + sub.name + '"'
      @sub3 = @sub3 + item
    end
    
    @subcategories4 = Subcategory.where(category_id: 4)
    @sub4 = '"---"'
    @subcategories4.each do |sub|
      item = ',"' + sub.name + '"'
      @sub4 = @sub4 + item
    end
    
    @prefectures = Prefecture.new
  end
  
  def create
    @community = Community.new(community_params)
    @community.user_id = current_user.id
    @community.public = 0
    if @community.save
      redirect_to pages_index_path, success: 'コミュニティを開設しました'
    else
      redirect_to pages_index_path, danger: 'コミュニティの開設に失敗しました'
      #flash.now[:danger] = "コミュニティ作成に失敗しました"
      #render :new
    end
  end
  
  private
    def community_params
      params.require(:community).permit(:communityName, :category, :subcategory, :prefecture, :sex)
    end
end