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

function orderNodes(entries) {
    let returnArray = []
    let entriesTab = []
    entries.forEach(e => {
        entriesTab.push(e.split(",").reverse())
    })
    function createtree(subarray, currentdepth) {

        let retsubobj = {
            "text": '',
            "children": []
        }
        let subdistinct = {}

        retsubobj.text = subarray[0][currentdepth - 1]

        retsubobj.id = subarray[0].slice(0, currentdepth).reverse().join(',')

        subarray.forEach(subentry => {
            if (subentry[currentdepth]) {
                subdistinct[subentry[currentdepth]] = ""
            }
        })

        for ([key, value] of Object.entries(subdistinct)) {
            let subsubarray = []
            subarray.forEach(subentry => {
                if (subentry[currentdepth] && subentry[currentdepth] == key) {

                    subsubarray.push(subentry)
                }

            })
            if (subsubarray != []) {

                retsubobj.children.push(createtree(subsubarray, currentdepth + 1))
            }

        }
        if (retsubobj.children.length == 0) {
            delete retsubobj.children
        }

        return retsubobj
    }

    finalobj = createtree(entriesTab, 1)

    returnArray.push(finalobj)
    return returnArray
}

console.log(JSON.stringify(orderNodes(entries), null, 4))
