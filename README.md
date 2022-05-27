# New-Password
Creates a password, a random (secure) string of a specific size and with a specific complexity

 .SYNOPSIS
    Generates a password.
.DESCRIPTION
    Creates a random string of a specific size and with a specific complexity.
.PARAMETER Length
    The (minimal) password length (alias Size).
    If there are more mandatory characters, the length will be the total of the mandatory
    (uppercase, lowercase, numeral and/or symbol) characters'
.PARAMETER Uppercase
    The number of mandatory uppercase character (default 1)
    If set to zero, the password might contain 0 or more uppercase characters.
    If set to a negative amount, the password will not contain any uppercase characters.
.PARAMETER Lowerase
    The number of mandatory lowercase character (default 1)
    If set to zero, the password might contain 0 or more lowercase characters.
    If set to a negative amount, the password will not contain any lowercase characters.
.PARAMETER Numerals
    The number of mandatory numeric character (default 1)
    If set to zero, the password might contain 0 or more numeric characters.
    If set to a negative amount, the password will not contain any numeric characters.
.PARAMETER Symbols
    The number of mandatory symbol character (default 1)
    If set to zero, the password might contain 0 or more symbol characters.
    If set to a negative amount, the password will not contain any symbol characters.
.PARAMETER Exclude
    The Exclude parameter lets you exclude specific characters that have a special meaning for
    specific applications or might lead to confusion (as an alphanumeric O and a numeric 0).
.PARAMETER AsSecureString
    When you use this parameter, the output of the New-Password cmdlet is a SecureString object.
.EXAMPLE
    Create a password of 8 characters with at least one uppercase character, one lowercase character,
    one numeral and one symbol:
    PS> New-Password
.EXAMPLE
    Create a password of 30 characters with at least one uppercase character, one lowercase character,
    one numeral and one symbol and do not use special AD characters:
    PS> New-Password -Size 30 -Exclude ',\#+<>;"='
.EXAMPLE
    Create a password of 30 (8 + 9 + 8 + 5) characters with at 8 uppercase characters, 9 lowercase
    characters, 8 numerals and 5 symbols and do not use special AD characters:
    PS> New-Password -Lower 8 -Upper 9 -Numerals 8 -Symbols 5 -Exclude ',\#+<>;"='
.EXAMPLE
    Create a secure string password with at least one uppercase character, one lowercase character,
    one numeral and no symbols:
    PS> New-Password -Symbols -1 -AsSecureString
