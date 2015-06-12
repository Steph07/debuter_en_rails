class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all 
    #appel le modèle Post pour retrourner tous les posts dans la table
    #le résultat de cet appel est un tableau de posts stocké dans la variable d'instance @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      # L’action create instancie un nouvel objet Post à partir des données fournies par le formulaire, que Rails 
      # rend disponible dans le hash params. Après avoir sauvé le nouveau post, create retourne le format approprié 
      # en fonction de la demande (HTML dans notre cas). Elle redirige alors vers l’action show pour le post créé et 
      # initialise une “notice” (note) indiquant que la création s’est bien passée.
      # Le message “Post was successfully created.” est stocké par Rails dans le hash flash (souvent appelé simplement 
      #  le flash) pour conserver les messages d’une action à l’autre, fournissant ainsi des informations utiles sur le statut des requêtes.
      # Le Flash conserve le message pour l’action suivante, ainsi lors de cette redirection vers l’action show, il peut être affiché que le “Post was successfully created.”
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        #Si le post n’a pas été sauvé pour un problème de validation, le contrôleur renvoie à l’action new avec un message d’erreur.
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    # Dans l’action update, Rails utilise d’abord le paramètre :id passé par la vue pour retrouver l’enregistrement en cours d’édition. 
    # L’appel update_attributes utilise ensuite les autres paramètres de la requête pour mettre à jour cet enregistrement. Si tout se passe bien, 
    # Rails redirige alors vers la vue show du post. En cas de problème, c’est un retour à la vue edit pour corriger les informations.
    #respond_to gère à la fois les appels HTML et json (équivalent de XML mais en JavaScript) à cette action.
    #il est possible de voir l'affichage au format json à l'adresse http://localhost:3000/posts.json
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
  # La méthode destroy de l’instance d’un modèle Active Record supprime l’enregistrement 
  # correspondant de la base. Après cela il ne peut plus être affiché donc Rails redirige 
  # vers la vue index pour le modèle.
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :title, :content)
    end
end
