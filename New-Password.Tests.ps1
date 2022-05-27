#Requires -Modules @{ModuleName="Pester"; ModuleVersion="5.0.0"}

Describe 'Join-Object' {

    BeforeAll {

        Set-StrictMode -Version Latest

        Set-Alias -Name New-Password -value .\New-Password.ps1

        $Uppercase = [Char[]]'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        $Lowercase = [Char[]]'abcdefghijklmnopqrstuvwxyz'
        $Numerals  = [Char[]]'0123456789'
        $Symbols   = [Char[]]'!"#$%&''()*+,-./:;<=>?@[\]^_`{|}~'

    }

    Context 'Default' {

        BeforeAll {
            $Password = New-Password
        }

        It 'Length should be default (8)' {
            $Password.Length |Should -be 8
        }

        It 'It should contain an uppercase character' {
            ([Char[]]$Password).Where{ $_ -cIn $Uppercase } |Should -Not -BeNullOrEmpty
        }

        It 'It should contain an lowercase character' {
            ([Char[]]$Password).Where{ $_ -cIn $Lowercase } |Should -Not -BeNullOrEmpty
        }

        It 'It should contain a number' {
            ([Char[]]$Password).Where{ $_ -cIn $Numerals }  |Should -Not -BeNullOrEmpty
        }

        It 'It should contain a symbol' {
            ([Char[]]$Password).Where{ $_ -cIn $Symbols }   |Should -Not -BeNullOrEmpty
        }
    }

    Context 'Multiple madatory character sets' {

        BeforeAll {
            $Password = New-Password -UpperCase 4 -LowerCase 4 -Numerals 4 -Symbols 4
        }

        It 'Length should be 16' {
            $Password.Length |Should -be 16 -Because '4 x 4 = 16'
        }

        It 'It should contain 4 uppercase characters' {
            @(([Char[]]$Password).Where{ $_ -cIn $Uppercase }).Count |Should -be 4
        }

        It 'It should contain 4 lowercase characters' {
            @(([Char[]]$Password).Where{ $_ -cIn $Lowercase }).Count |Should -be 4
        }

        It 'It should contain 4 numbers' {
            @(([Char[]]$Password).Where{ $_ -cIn $Numerals }).Count |Should -be 4
        }

        It 'It should contain 4 symbols' {
            @(([Char[]]$Password).Where{ $_ -cIn $Symbols }).Count |Should -be 4
        }
    }
    
    Context 'Multiple mandatory characters (numbers) ' {

        BeforeAll {
            $Password = New-Password -Length 8 -UpperCase 0 -LowerCase 0 -Numerals 8 -Symbols 0
        }

        It 'Length should be default (8)' {
            $Password.Length |Should -be 8
        }

        It 'It should contain only numbers' {
            [int]$Password |Should -BeOfType [int]
        }
    }

    Context 'Excluding character sets' {

        BeforeAll {
            $Password = New-Password -Length 8 -UpperCase -1 -LowerCase -1 -Numerals 0 -Symbols -1
        }

        It 'Length should be default (8)' {
            $Password.Length |Should -be 8
        }

        It 'It should contain only numbers' {
            [int]$Password |Should -BeOfType [int]
        }
    }

    Context 'Excluding specific characters' {

        BeforeAll {
            $Password = New-Password -Length 8 -UpperCase 0 -LowerCase 0 -Numerals 8 -Symbols 0 -Exclude '123456789'
        }

        It '8 zeros' {
            $Password |Should -be '00000000'
        }
    }
    
    Context 'As Secure String' {

        BeforeAll {
            $SecurePassword = New-Password -AsSecureString
            $Ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToCoTaskMemUnicode($ss)
            $Password = [System.Runtime.InteropServices.Marshal]::PtrToStringUni($Ptr)
            [System.Runtime.InteropServices.Marshal]::ZeroFreeCoTaskMemUnicode($Ptr)
        }

        It 'Length should be default (8)' {
            $Password.Length |Should -be 8
        }

        It 'It should contain an uppercase character' {
            ([Char[]]$Password).Where{ $_ -cIn $Uppercase } |Should -Not -BeNullOrEmpty
        }

        It 'It should contain an lowercase character' {
            ([Char[]]$Password).Where{ $_ -cIn $Lowercase } |Should -Not -BeNullOrEmpty
        }

        It 'It should contain a number' {
            ([Char[]]$Password).Where{ $_ -cIn $Numerals }  |Should -Not -BeNullOrEmpty
        }

        It 'It should contain a symbol' {
            ([Char[]]$Password).Where{ $_ -cIn $Symbols }   |Should -Not -BeNullOrEmpty
        }
    }
}