﻿#Dr. Burkman
#Mod 09 Homework

#Variable Declarations
$SODA_BASE_PRICE = 100
$payment = 0
$balance = 0


$price_variance = (Get-Random -Minimum -3 -Maximum 4 ) *5
$soda_price = $SODA_BASE_PRICE + $price_variance
$balance = $soda_price - $payment

clear
Write-Host "Welcome to the soda machine.  You can enter values of 5, 10 or 25 in payment`r`n"

while ($true)
{
    $soda_type = Read-Host -Prompt "What type of soda would you like?"
    if ($soda_type -eq "")
    {
        Write-Host "`r`nYou must enter a value.  Press Enter to try again."
        Read-Host
        clear
        continue
    }
    else
    {
        break
    }
}

clear
Write-Host "The current price of $soda_type is $soda_price cents"

while($true)
{
    $coin = Read-Host -Prompt "`r`nEnter a coin"
    clear
    if ($coin -eq 5)
    {
        Write-Host "You have inserted a nickel.`r`n"
    }
    elseif ($coin -eq 10)
    {
        Write-Host "You have inserted a dime.`r`n"
    }
    elseif ($coin -eq 25)
    {
        Write-Host "You have inserted a quarter.`r`n"
    }
    else
    {
        Write-Host "That is not a valid amount.`r`n"
        Write-Host "You still owe $balance cents"
        continue
    }

    $payment += $coin/1
    $balance = $soda_price - $payment

    if($balance -gt 0)
    {
        Write-Host "You still owe $balance cents"
    }

    elseif($balance -lt 0)
    {
        $refund = [math]::abs($balance)
        Write-host "You have been refunded $refund cents`r`n"
        break
    }

    else
    {
        break
    }
}

write-host "Enjoy your $soda_type!`r`n"

Read-Host -Prompt "Press enter to close the program"


