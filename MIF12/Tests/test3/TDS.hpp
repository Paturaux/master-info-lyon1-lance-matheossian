#ifndef _TableDesSymboles_
#define _TableDesSymboles_

#include <vector>

#include "Symbole.hpp"

/**
*	@brief La table des symboles.
*/
class TableDesSymboles {

	private:

		std::vector<Symbole*> tableSymb; /** @param tableSymb la table des symboles */
		int numeroContexteTS;
		int numIdActuel;
		
	public:

		int incNumIdActuel();
		int incNumContexteActuel();

//###################################################################################### CONSTRUCTEURS/DESTRUCTEURS
		
        /**
        *   @brief Constructeur
        */
		TableDesSymboles(); // constructeur appelé uniquement par la table des symboles mère (num contexte initialisé à 0)

	/**
        *   @brief Constructeur
	*   @param numContexte entier initialisant le numéro de contexte de la TS
        */
		TableDesSymboles(int numContexte);

        /**
        *   @brief Destructeur
        */
		~TableDesSymboles();


//###################################################################################### ACCESSEURS

	/**
        *   @brief Accesseur
	*   Récupère numeroContexteTS
        */
		int getNumContexteTS();

	/**
        *   @brief Accesseur
	*   Récupère numIdActuel
        */
		int getNumIdActuel();

	
	/**
        *   @brief Accesseur
	*   Récupère tableSymb
        */
		std::vector<Symbole*> getTableSymb();


//######################################################################################

        /**
        *   @brief Ajoute le symble dans la liste des symboles
        *   @param symb adresse d'un symbole
        */
		void ajouter(Symbole* symb);


        /**
        *   @brief Affiche le contenu de la table
        */
	void afficherTablePrincipale();
	
	void afficherTable();

	void afficherTables(std::vector<TableDesSymboles*> listeTDS);
};

#endif
