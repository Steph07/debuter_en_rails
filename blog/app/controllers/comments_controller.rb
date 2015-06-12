class CommentsController < ApplicationController
  def create

     # chaque requête pour un comment doit garder trace du post de rattachement, 
     # d’où le find initial pour obtenir ce post
    @post = Post.find(params[:post_id])

    # Nous utilisons la méthode create sur @post.comments pour créer et sauver le 
    # comment. Cela lie automatiquement le comment afin qu’il soit bien rattaché 
    # à ce post précis.
    @comment = @post.comments.create(params[:comment])

    # Une fois que ce comment est fait, nous sommes renvoyés au post original 
    # grâce à l’helper post_path(@post). Ceci appelle l’action show de PostsController 
    # qui à son tour rend le modèle show.html.erb. C’est là que nous souhaitons 
    # voir le comment
    redirect_to post_path(@post)
  end
end
