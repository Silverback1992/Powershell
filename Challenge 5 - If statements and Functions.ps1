#If statements and Functions Challenge

function MainMenu($message)
{
    cls
    echo "***Main Menu***"
    echo "Please choose an option below:"
    echo "1) Sub Menu 1"
    echo "2) Sub Menu 2"
    echo "3) Quit`r`n"
    echo $message
}

function SubMenu($message)
{
    cls
    echo "***Sub Menu***"
    echo "Please choose an option below:"
    echo "1) Option 1"
    echo "2) Option 2"
    echo "3) Go Back`r`n"
    echo $message
}

cls

$mainQuit = 0
$subQuit = 0
MainMenu

while(-Not($mainQuit))
{
    $mainQuit = 0
    $userInput = Read-Host

    if($userInput -eq "3")
    {$mainQuit = 1}
    elseif($userInput -eq "1" -or $userInput -eq "2")
    {
        SubMenu

        while(-Not($subQuit))
        {
            $userInput = Read-Host

            switch ($userInput)
            {
                1 {SubMenu -message "You chose opt 1"} 
                2 {SubMenu -message "You chose opt 2"}
                3 {$subQuit = 1
                MainMenu}
                default {SubMenu -message "Error: Invalid choice"}
            }
        }
    }
    else
    {MainMenu -message "Error: Invalid choice"}

    $subQuit = 0
}