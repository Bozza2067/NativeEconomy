walletBalance = 69
bankBalance = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000)
        StatSetInt("MP0_WALLET_BALANCE", walletBalance, true)
        StatSetInt("BANK_BALANCE", bankBalance, true)
    end
end)

StatSetInt("MP0_WALLET_BALANCE", walletBalance, true)
StatSetInt("BANK_BALANCE", bankBalance, true)

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