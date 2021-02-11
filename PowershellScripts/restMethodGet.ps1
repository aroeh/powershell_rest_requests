$url = "https://localhost:5001/power"
$headers = @{
    'Content-Type' = 'application/json'
    'Accept' = 'application/json'
}

try{
    Write-Host "Getting Data"

    #rest method just returns the parsed content of the response body
    $result = Invoke-RestMethod -Uri $url -Headers $headers -Method 'GET'

    Write-Host "Success!"
    Write-Host $result[0]
}
catch [System.SystemException] {
    Write-Host "Failed :("
    Write-Host "Status Code: " $_.Exception.Response.StatusCode.value__
    Write-Host "Error Details: " $_.ErrorDetails
    Write-Host "Message: " $_.Exception.Message -BackgroundColor DarkRed
    Write-Host "Line: " $_.InvocationInfo.Line -BackgroundColor DarkRed
    Write-Host "Item: " $_.Exception.ItemName -BackgroundColor DarkRed
}