class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc})
    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })
    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show.html.erb"})
  end  

  def baii
    the_id = params.fetch("toast_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.at(0)
    the_photo.destroy
    #render ({ :template => "photo_templates/baii.html.erb"})
    redirect_to("/photos")
  end

  def create
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")
    
    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    #render({ :template => "photo_templates/create.html.erb"})
    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.image = params.fetch("input_image")
    the_photo.caption = params.fetch("input_caption")
    the_photo.save

    #render({ :template => "photo_templates/update.html.erb"})
    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def comment
    the_id = params.fetch("input_photo_id")
    matching_comments = Comment.where({ :photo_id => the_id})
    the_comment = matching_comments.at(0)
    a_new_comment = Comment.new
    a_new_comment


    #the_author_id = params.fecth("input_author_id")
    


    redirect_to("/photos/" + )

  end  
end