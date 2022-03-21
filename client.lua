-- Set default balance
WalletBalance = 100
BankBalance = 2000

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

-- Show current balance in the corner like in GTA:O
Citizen.CreateThread(function()
    while true do
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