function Convert-StringToCamelCase($String)
{
    if($String -eq ""){return $null}
    if($String -Match "-"){$arr = $String -split "-"}
    elseif($String -Match "_"){$arr = $String -split "_"}

    For($i = 0; $i -lt $arr.Count; $i++)
    {
        $arr[$i] = (Get-Culture).TextInfo.ToTitleCase($arr[$i])
    }
    
    $arr = $arr -join ""

    return $arr
}

Describe "Fixed Tests" {
	It "Should pass" {
		Convert-StringToCamelCase("the_stealth_warrior") | Should Be "theStealthWarrior"
	}
	
	It "Should pass" {
		Convert-StringToCamelCase("The-Stealth-Warrior") | Should Be "TheStealthWarrior"
	}
	
	It "Should pass" {
		Convert-StringToCamelCase("") | Should Be ""
	}
	
	It "Should pass" {
		Convert-StringToCamelCase("A-B-C") | Should Be "ABC"
	}
}