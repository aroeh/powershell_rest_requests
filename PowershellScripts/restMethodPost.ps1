$url = "https://localhost:5001/power"
$headers = @{
    'Content-Type' = 'application/json'
    'Accept' = 'application/json'
}
$body = @{
    id = 3
    abilities = @(
        [PSCustomObject]@{
            name = "Mind Reading"
            type = 2
            limits = "must remain focused"
        }
    )
    weaknesses = @(
        [PSCustomObject]@{
            name = "Distraction"
            type = 2
            activation = "squirrel!!"
        }
    )
}

try{
    Write-Host "Getting Data"

    #rest method just returns the parsed content of the response body
    $json = $body | ConvertTo-Json
    $result = Invoke-RestMethod -Uri $url -Headers $headers -Method 'POST' -Body $json

    Write-Host "Success!"
    Write-Host $result
}
catch [System.SystemException] {
    Write-Host "Failed :("
    Write-Host "Status Code: " $_.Exception.Response.StatusCode.value__
    Write-Host "Description: " $_.Exception.Response.StatusDescription
    Write-Host "Error Details: " $_.ErrorDetails
    Write-Host "Message: " $_.Exception.Message -BackgroundColor DarkRed
    Write-Host "Line: " $_.InvocationInfo.Line -BackgroundColor DarkRed
    Write-Host "Item: " $_.Exception.ItemName -BackgroundColor DarkRed
}