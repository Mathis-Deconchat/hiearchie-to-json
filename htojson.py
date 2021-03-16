import json

entries = [
    'OU=France,OU=root',
    'OU=Paris,OU=France,OU=root',
    'OU=Lyon,OU=France,OU=root',
    'OU=Toulouse,OU=France,OU=root',
    'OU=Capitole,OU=Toulouse,OU=France,OU=root',
    'OU=Angleterre,OU=root',
    'OU=Londre,OU=Angleterre,OU=root',
    'OU=Manchester,OU=Angleterre,OU=root',
    'OU=Liverpool,OU=Angleterre,OU=root']


def orderNodes(etr):
    returnArray = []
    reverseEntries = []
    # Inverser la hiéarchie
    for e in etr:
        reverseArrayOfString = e.split(',')
        reverseArrayOfString.reverse()

        reverseEntries.append(reverseArrayOfString)

        print(reverseEntries.count)

    def createTree(subArray, depth):
        # Création du template de tout les objets
        returnObject_dict = {
            "name": '',
            "children": []
        }

        subChilds_dict = {}

        # Texte du premier noeud est la premiere array de l'array passé à la fonction, et nth (depth) de cette array

        returnObject_dict['name'] = subArray[0][depth - 1]


        # pour chaque élement de la subarray, si il reste d'autres élements à un niveau en dessous de la hiéarchie, les ajouter dans subChilds
        for s in subArray:

            if(len(s) > depth):
                subChilds_dict[s[depth]] = ''

        print(subChilds_dict)

        for attr, value in subChilds_dict.items():
            subSubArray = []

            for s in subArray:
                if((len(s) > depth) and (s[depth] == attr)):
                    subSubArray.append(s)

            if(subArray != []):
                returnObject_dict['children'].append(
                    createTree(subSubArray, depth + 1))

        # print(subSubArray)
        return returnObject_dict

    # Execution de la fonction
    o = createTree(reverseEntries, 1)
    #parsed = json.loads(o)
    #print(json.dumps(o, indent=4))


orderNodes(entries)
