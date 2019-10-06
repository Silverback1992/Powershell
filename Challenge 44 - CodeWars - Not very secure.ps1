function Test-PasswordSecurity([System.String]$Pass)
{
	
}

Describe 'Test Cases' {
	It 'Should pass' {
		Test-PasswordSecurity("Mazinkaiser") | Should be $true
	}
	It 'Should pass' {
		Test-PasswordSecurity("hello world_") | Should be $false
	}
	It 'Should pass' {
		Test-PasswordSecurity("PassW0rd") | Should be $true
	}
	It 'Should pass' {
		Test-PasswordSecurity("    ") | Should be $false
	}
}