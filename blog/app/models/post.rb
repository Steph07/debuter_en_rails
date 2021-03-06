class Post < ActiveRecord::Base
     # Contrôle que tous les objets "Post" ont :
     # name et title renseigné
     # la longueur de title est de minimum 5 caractères
     validates :name,  :presence => true
     validates :title, :presence => true,
               :length => { :minimum => 5 } 

     # Cette ligne signifie que chaque "Post" peut avoir plusieurs "comments"
     # on appel ça une association entre objets (équivalent à lien entre tables)
     has_many :comments
end
