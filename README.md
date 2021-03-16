# Hiearchie to JSON
Le but étant de convertir un structure hiéarchique textuelle du format 
```[
    'OU=France,OU=root',
    'OU=Paris,OU=France,OU=root',
    'OU=Lyon,OU=France,OU=root',
    'OU=Toulouse,OU=France,OU=root',
    'OU=Capitole,OU=Toulouse,OU=France,OU=root',
    'OU=Angleterre,OU=root',
    'OU=Londre,OU=Angleterre,OU=root',
    'OU=Manchester,OU=Angleterre,OU=root',
    'OU=Liverpool,OU=Angleterre,OU=root']
```

en
 ```
[
    {
        "text": "OU=root",
        "children": [
            {
                "text": "OU=France",
                "children": [
                    {
                        "text": "OU=Paris",
                        "id": "OU=Paris,OU=France,OU=root"
                    },
                    {
                        "text": "OU=Lyon",
                        "id": "OU=Lyon,OU=France,OU=root"
                    },
                    {
                        "text": "OU=Toulouse",
                        "children": [
                            {
                                "text": "OU=Capitole",
                                "id": "OU=Capitole,OU=Toulouse,OU=France,OU=root"
                            }
                        ],
                        "id": "OU=Toulouse,OU=France,OU=root"
                    }
                ],
                "id": "OU=France,OU=root"
            },
            {
                "text": "OU=Angleterre",
                "children": [
                    {
                        "text": "OU=Londre",
                        "id": "OU=Londre,OU=Angleterre,OU=root"
                    },
                    {
                        "text": "OU=Manchester",
                        "id": "OU=Manchester,OU=Angleterre,OU=root"
                    },
                    {
                        "text": "OU=Liverpool",
                        "id": "OU=Liverpool,OU=Angleterre,OU=root"
                    }
                ],
                "id": "OU=Angleterre,OU=root"
            }
        ],
        "id": "OU=root"
    }
]
```
