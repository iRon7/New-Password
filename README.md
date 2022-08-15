# New-Password
Generates a password.
## [Syntax](#syntax)
```PowerShell
New-Password
    [-Length <Int32>]
    [-Uppercase <Int32>]
    [-Lowercase <Int32>]
    [-Numerals <Int32>]
    [-Symbols <Int32>]
    [-Exclude <Char[]>]
    [-AsSecureString]
    [<CommonParameters>]
```
## [Description](#description)
 Creates a random (secure) string of a specific size and with a specific complexity.

## [Examples](exampls)
### Example 1
```PowerShell
New-Password
```
 Creates a password of 8 characters with at least one uppercase character, one lowercase character,  
one numeral and one symbol:

### Example 2
```PowerShell
New-Password -Size 30 -Exclude ',\#+<>;"='
```
 Creates a password of 30 characters with at least one uppercase character, one lowercase character,  
one numeral and one symbol and do not use special AD characters:

### Example 3
```PowerShell
New-Password -Lower 8 -Upper 9 -Numerals 8 -Symbols 5 -Exclude ',\#+<>;"='
```
 Creates a password of 30 (8 + 9 + 8 + 5) characters with at 8 uppercase characters, 9 lowercase  
characters, 8 numerals and 5 symbols and do not use special AD characters:

### Example 4
```PowerShell
New-Password -Symbols -1 -AsSecureString
```
 Creates a secure string password with at least one uppercase character, one lowercase character,  
one numeral and no symbols:

## [Parameters](#parameters)
### `-Length`
 The (minimal) password length (alias Size).  
If there are more mandatory characters, the length will be the total of the mandatory  
(uppercase, lowercase, numeral and/or symbol) characters&#39;

| <!--                    --> | <!-- --> |
| --------------------------- | -------- |
| Type:                       | [Int32](https://docs.microsoft.com/en-us/dotnet/api/System.Int32) |
| Position:                   | 1 |
| Default value:              | 8 |
| Accept pipeline input:      | false |
| Accept wildcard characters: | false |
### `-Uppercase`
 The number of mandatory uppercase character (default 1)  
If set to zero, the password might contain 0 or more uppercase characters.  
If set to a negative amount, the password will not contain any uppercase characters.

| <!--                    --> | <!-- --> |
| --------------------------- | -------- |
| Type:                       | [Int32](https://docs.microsoft.com/en-us/dotnet/api/System.Int32) |
| Position:                   | 2 |
| Default value:              | 1 |
| Accept pipeline input:      | false |
| Accept wildcard characters: | false |
### `-Lowercase`
| <!--                    --> | <!-- --> |
| --------------------------- | -------- |
| Type:                       | [Int32](https://docs.microsoft.com/en-us/dotnet/api/System.Int32) |
| Position:                   | 3 |
| Default value:              | 1 |
| Accept pipeline input:      | false |
| Accept wildcard characters: | false |
### `-Numerals`
 The number of mandatory numeric character (default 1)  
If set to zero, the password might contain 0 or more numeric characters.  
If set to a negative amount, the password will not contain any numeric characters.

| <!--                    --> | <!-- --> |
| --------------------------- | -------- |
| Type:                       | [Int32](https://docs.microsoft.com/en-us/dotnet/api/System.Int32) |
| Position:                   | 4 |
| Default value:              | 1 |
| Accept pipeline input:      | false |
| Accept wildcard characters: | false |
### `-Symbols`
 The number of mandatory symbol character (default 1)  
If set to zero, the password might contain 0 or more symbol characters.  
If set to a negative amount, the password will not contain any symbol characters.

| <!--                    --> | <!-- --> |
| --------------------------- | -------- |
| Type:                       | [Int32](https://docs.microsoft.com/en-us/dotnet/api/System.Int32) |
| Position:                   | 5 |
| Default value:              | 1 |
| Accept pipeline input:      | false |
| Accept wildcard characters: | false |
### `-Exclude`
 The Exclude parameter lets you exclude specific characters that have a special meaning for  
specific applications or might lead to confusion (as an alphanumeric O and a numeric 0).

| <!--                    --> | <!-- --> |
| --------------------------- | -------- |
| Type:                       | [Char[]](https://docs.microsoft.com/en-us/dotnet/api/System.Char[]) |
| Position:                   | 6 |
| Default value:              |  |
| Accept pipeline input:      | false |
| Accept wildcard characters: | false |
### `-AsSecureString`
 When you use this parameter, the output of the New-Password cmdlet is a SecureString object.

| <!--                    --> | <!-- --> |
| --------------------------- | -------- |
| Type:                       | [SwitchParameter](https://docs.microsoft.com/en-us/dotnet/api/System.Management.Automation.SwitchParameter) |
| Position:                   | named |
| Default value:              | False |
| Accept pipeline input:      | false |
| Accept wildcard characters: | false |
## [Outputs](#outputs)
### [String](https://docs.microsoft.com/en-us/dotnet/api/System.String)
## [Related Links](#related-links)
* [https://stackoverflow.com/a/37275209/1701026](https://stackoverflow.com/a/37275209/1701026)
