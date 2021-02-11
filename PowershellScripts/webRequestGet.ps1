$url = "https://localhost:5001/power"
$headers = @{
    'Content-Type' = 'application/json'
    'Accept' = 'application/json'
}

try{
    Write-Host "Getting Data"

    # WebRequest method just returns the full response
    $result = Invoke-WebRequest -Uri $url -Headers $headers -Method 'GET'
    
    if($result.StatusCode -eq 200) {
        Write-Host "Success!"
        Write-Host $result.Content
    }
}
catch [System.SystemException] {
    Write-Host "Failed :("
    Write-Host "Status Code: " $_.Exception.Response.StatusCode.value__
    Write-Host "Error Details: " $_.ErrorDetails
    Write-Host "Message: " $_.Exception.Message -BackgroundColor DarkRed
    Write-Host "Line: " $_.InvocationInfo.Line -BackgroundColor DarkRed
    Write-Host "Item: " $_.Exception.ItemName -BackgroundColor DarkRed
}