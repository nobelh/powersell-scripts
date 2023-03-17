# Define variables
$server = "server1"
$smtpServer = "10.0.0.3"
$from = "sender@example.com"
$to = "recipient@example.com"
$subject = "Server unreachable"
$body = "The server $server is not reachable."

# Test connectivity to the server
if (Test-Connection -ComputerName $server -Count 1 -Quiet) {
    Write-Host "$server is reachable."
} else {
    Write-Host "$server is not reachable."
    # Send email using the smtp server
    Send-MailMessage -From $from -To $to -Subject $subject -Body $body -SmtpServer $smtpServer
}
