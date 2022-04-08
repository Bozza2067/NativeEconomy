-- Set default balance
WalletBalance = 50 -- 32 BIT INTEGER!! STACK OVERFLOW!!
BankBalance = 5000 -- 32 BIT INTEGER!! STACK OVERFLOW!!
StatSetInt("MP0_WALLET_BALANCE", WalletBalance, true)
StatSetInt("BANK_BALANCE", BankBalance, true)

-- Update balance stat every 5 seconds
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        StatSetInt("MP0_WALLET_BALANCE", WalletBalance, true)
        StatSetInt("BANK_BALANCE", BankBalance, true)
    end
end)

-- Main 0ms Loop
Citizen.CreateThread(function()
    while true do

        -- Correct stack overflow error
        if WalletBalance > 2147483647 then
            WalletBalance = 2147483647
            ShowNotification("Your wallet balance exceeds the maximum supported value. Contact staff for assistance.")
        end
        if BankBalance > 2147483647 then
            BankBalance = 2147483647
            ShowNotification("Your bank balance exceeds the maximum supported value. Contact staff for assistance.")
        end

        -- Show HUD
        if IsControlPressed(0, 48) then
            N_0x170f541e1cadd1de(true)
            SetMultiplayerWalletCash()
            SetMultiplayerBankCash()
            N_0x170f541e1cadd1de(false)
            Citizen.Wait(4250)
            RemoveMultiplayerWalletCash()
            RemoveMultiplayerBankCash()
        end

        Citizen.Wait(0)
    end
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end