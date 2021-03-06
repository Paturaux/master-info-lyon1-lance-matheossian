#ifndef _FONCTION_
#define _FONCTION_

#include "Symbole.hpp"


/**
 * Gestion d'une fonction.
 */
class Fonction : public Symbole {
       
	
	private:
	
	Type* typeResult; /**< typeResult type contenant le type de retour de la fonction */
	int nomTDS; /**< nomTDS nom de la TDS dans laquelle la fonction est déclarée */
	int arite; /**< arite arité de la fonction */

	public:
	
	/**
    *   @brief Constructeur, initialise la fonction avec un identifiant et le type de retour
	*   @param _id identifiant du symbole
	*   @param _typeResult type du retour
	*   @param _arite nombre d'argument(s)
	*	@param _nomTDS la table des symbole
        */
        Fonction(int _id, Type* _typeResult,int _arite, int _nomTDS);
	
	/**
        *   @brief Accesseur 
	*   @return retourne un entier contenant le numéro de la TDS dans laquelle la fonction est déclarée
        */
	int getNomTDS();

	/**
        *   @brief Accesseur 
	*   @return retourne un entier contenant l'arité de la fonction
        */
	int getArite();


        /**
        *   @brief Destructeur
        */
        ~Fonction();	
	
	
};


#endif



