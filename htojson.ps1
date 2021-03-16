$entries =
@('OU=France,OU=root'),
@('OU=Paris,OU=France,OU=root'),
@('OU=Lyon,OU=France,OU=root'),
@('OU=Toulouse,OU=France,OU=root'),
@('OU=Capitole,OU=Toulouse,OU=France,OU=root'),
@('OU=Angleterre,OU=root'),
@('OU=Londre,OU=Angleterre,OU=root'),
@('OU=Manchester,OU=Angleterre,OU=root'),
@('OU=Liverpool,OU=Angleterre,OU=root')


$reverseEntry = @()

foreach ($e in $entries) {        
    [array]$splitted = $e.split(',')              
    [array]::Reverse($splitted)
    
    $obj = [PSCustomObject]@{
        val = $splitted;
        uid = (New-Guid)
    }
    $reverseEntry += $obj
}


function get-Tree() {
    [CmdletBinding()]
    param (
        [Parameter()]
        [array]
        $inputArray,        
        [Parameter()]
        [int]
        $depth
    )
    $outObj = [pscustomobject]@{
        name     = '';
        children = @()
    }

    $childs = new-object PSObject

    $outObj.name = $inputArray[0].val[$depth - 1]
   
    foreach ($i in $inputArray) {
        
        if ($i.val.count -gt $depth) {
            $child = $i.val[$depth]
            try {
                $childs | Add-Member -MemberType NoteProperty -Name $i.val[$depth] -Value 'e' -ErrorAction SilentlyContinue
                
            }
            catch {}
        }
    }

    
    foreach ($c in $childs.PsObject.properties.Name) { 
        $underArray = @()        
        
        foreach ($s in $inputArray) {
            if (($s.val.count -gt $depth) -and ($s.val[$depth] -eq $c)) {
                $underArray += $s
            }
        }           
        
        if ($underArray.count -gt 0) {
            $outObj.children += @(Get-Tree -inputArray $underArray -depth ($depth + 1))
        }
    } 



    if ($outObj.children.count -eq 0) {
        $outObj.psobject.properties.remove('children')
    }

    
    return $outObj
}

$o = get-Tree -inputArray $reverseEntry -depth  1
echo $o 


 
  



