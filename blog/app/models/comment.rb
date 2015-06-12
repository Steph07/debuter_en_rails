class Comment < ActiveRecord::Base
     # cette ligne signifie que chaque "Comment" appartient à un "post"
     # on appel ça une association entre objets (équivalent à lien entre tables)
      belongs_to :post
end

# Ces 2 déclarations (has_many, belongs_to) permettent de disposer automatiquement 
# de comportements. Par exemple, étant donnée une variable d’instance @post contenant 
# un post, tous les comments appartenant à ce post s’obtiennent dans le tableau 
# @post.comments.
