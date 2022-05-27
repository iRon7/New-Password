# New-Password
Creates a password, a random (secure) string of a specific size and with a specific complexity

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
        PS> SSO_CreatePassword

    .EXAMPLE
        PS> SSO_CreatePassword -Size 30 -Exclude ',\#+<>;"='

    .EXAMPLE
        PS> SSO_CreatePassword -Lower 8 -Upper 9 -Numerals 8 -Symbols 5 -Exclude ',\#+<>;"='

    .EXAMPLE
        PS> SSO_CreatePassword -Symbols -1
