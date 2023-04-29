$name_list = @('Constance Castillo', 'Kerry Goodwin',
 'Dorothy Carson', 'Craig Williams', 'Daryl Guzman', 'Sherman Stewart',
 'Marvin Collier', 'Javier Wilkerson', 'Lena Olson', 'Claudia George',
 'Erik Elliott', 'Traci Peters', 'Jack Burke', 'Jody Turner',
 'Kristy Jenkins', 'Melissa Griffin', 'Shelia Ballard', 'Armando Weaver',
 'Elsie Fitzgerald', 'Ben Evans', 'Lucy Baker', 'Kerry Anderson',
 'Kendra Tran', 'Arnold Wells', 'Anita Aguilar', 'Earnest Reeves',
 'Irving Stone', 'Alice Moore', 'Leigh Parsons', 'Mandy Perez',
 'Rolando Paul', 'Delores Pierce', 'Zachary Webster', 'Eddie Ward',
 'Alvin Soto', 'Ross Welch', 'Tanya Padilla', 'Rachel Logan',
 'Angelica Richards', 'Shelley Lucas', 'Alison Porter', 'Lionel Buchanan',
 'Luis Norman', 'Milton Robinson', 'Ervin Bryant', 'Tabitha Reid',
 'Randal Graves', 'Calvin Murphy', 'Blanca Bell', 'Dean Walters',
 'Elias Klein', 'Madeline White', 'Marty Lewis', 'Beatrice Santiago',
 'Willis Tucker', 'Diane Lloyd', 'Al Harrison', 'Barbara Lawson',
 'Jamie Page', 'Conrad Reynolds', 'Darnell Goodman', 'Derrick Mckenzie',
 'Erika Miller', 'Tasha Todd', 'Aaron Nunez', 'Julio Gomez',
 'Tommie Hunter', 'Darlene Russell', 'Monica Abbott', 'Cassandra Vargas',
 'Gail Obrien', 'Doug Morales', 'Ian James', 'Jean Moran',
 'Carla Ross', 'Marjorie Hanson', 'Clark Sullivan', 'Rick Torres',
 'Byron Hardy', 'Ken Chandler', 'Brendan Carr', 'Richard Francis',
 'Tyler Mitchell', 'Edwin Stevens', 'Paul Santos', 'Jesus Griffith',
 'Maggie Maldonado', 'Isaac Allen', 'Vanessa Thompson', 'Jeremy Barton',
 'Joey Butler', 'Randy Holmes', 'Loretta Pittman', 'Essie Johnston',
 'Felix Weber', 'Gary Hawkins', 'Vivian Bowers', 'Dennis Jefferson',
 'Dale Arnold', 'Joseph Christensen', 'Billie Norton', 'Darla Pope',
 'Tommie Dixon', 'Toby Beck', 'Jodi Payne', 'Marjorie Lowe',
 'Fernando Ballard', 'Jesse Maldonado', 'Elsa Burke', 'Jeanne Vargas',
 'Alton Francis', 'Donald Mitchell', 'Dianna Perry', 'Kristi Stephens',
 'Virgil Goodwin', 'Edmund Newton', 'Luther Huff', 'Hannah Anderson',
 'Emmett Gill', 'Clayton Wallace', 'Tracy Mendez', 'Connie Reeves',
 'Jeanette Hansen', 'Carole Fox', 'Carmen Fowler', 'Alex Diaz',
 'Rick Waters', 'Willis Warren', 'Krista Ferguson', 'Debra Russell',
 'Ellis Christensen', 'Freda Johnston', 'Janis Carpenter', 'Rosemary Sherman',
 'Earnest Peters', 'Kelly West', 'Jorge Caldwell', 'Moses Norris',
 'Erica Riley', 'Ray Gordon', 'Abel Poole', 'Cary Boone',
 'Grant Gomez', 'Denise Chapman', 'Vernon Moran', 'Ben Walker',
 'Francis Benson', 'Andrea Sullivan', 'Wayne Rice', 'Jamie Mason',
 'Jane Figueroa', 'Pat Wade', 'Rudy Bates', 'Clyde Harris',
 'Andre Mathis', 'Carlton Oliver', 'Merle Lee', 'Amber Wright',
 'Russell Becker', 'Natalie Wheeler', 'Maryann Miller', 'Lucia Byrd',
 'Jenny Zimmerman', 'Kari Mccarthy', 'Jeannette Cain', 'Ian Walsh',
 'Herman Martin', 'Ginger Farmer', 'Catherine Williamson', 'Lorena Henderson',
 'Molly Watkins', 'Sherman Ford', 'Adam Gross', 'Alfred Padilla',
 'Dwayne Gibson', 'Shawn Hall', 'Anthony Rios', 'Kelly Thomas',
 'Allan Owens', 'Duane Malone', 'Chris George', 'Dana Holt',
 'Muriel Santiago', 'Shelley Osborne', 'Clinton Ross', 'Kelley Parsons',
 'Sophia Lewis', 'Sylvia Cooper', 'Regina Aguilar', 'Sheila Castillo',
 'Sheri Mcdonald', 'Lynn Hodges', 'Patrick Medina', 'Arlene Tate',
 'Minnie Weber', 'Geneva Pena', 'Byron Collier', 'Veronica Higgins',
 'Leo Roy', 'Nelson Lopez')



function option_1 () 
{
    clear
    $name_counter = 0
    $first_name_begins_with = read-host -Prompt "`r`nEnter the first name, or a partial start of the first name"
    write-host
    $first_name_begins_with = (Get-Culture).TextInfo.ToTitleCase($first_name_begins_with.ToLower())
    foreach($i in $name_list)
    {
        if($i.StartsWith($first_name_begins_with))
        {
         Write-Host $i
         $name_counter += 1
        }
    }
    if($name_counter -eq 0)
    {
        write-host 'No first names were found starting with' (Get-Culture).TextInfo.ToTitleCase($first_name_begins_with.ToLower())
    }
    write-host "`r`nPress Enter to return to the previous menu"
    Read-Host
}

function option_2 () 
{
    clear
    $name_split = @()
    $name_counter = 0
    $last_name_begins_with = read-host -Prompt "`r`nEnter the last name, or a partial start of the last name"
    write-host
    $last_name_begins_with = (Get-Culture).TextInfo.ToTitleCase($last_name_begins_with.ToLower())
    foreach($i in $name_list)
    {
        $name_split = $i.Split(" ")
        if($name_split[1].StartsWith($last_name_begins_with))
        {
         Write-Host $i
         $name_counter += 1
        }
    }

    if($name_counter -eq 0)
    {
        write-host 'No last names were found starting with' (Get-Culture).TextInfo.ToTitleCase($last_name_begins_with.ToLower())
    }
    write-host "`r`nPress Enter to return to the previous menu"
    Read-Host
}

function option_3()
{
    clear

    while ($true)
    {
        $new_first_name = Read-Host -Prompt "`r`nEnter the new first name"
        if ($new_first_name -like "* *")
        {
            cls
            write-host "First name only, please.  Press Enter to continue."
            read-host
            cls
            continue
        }
        else
        {
        break
        }
    }
    $new_last_name = Read-Host -Prompt "Enter the new last name"
    $new_name = (Get-Culture).TextInfo.ToTitleCase($new_first_name.ToLower()) + " " +
        (Get-Culture).TextInfo.ToTitleCase($new_last_name.ToLower())
    write-host

    write-host $new_name "has been added"
    $global:name_list += $new_name

    write-host "`r`nPress Enter to return to the previous menu"
    Read-Host
}

function option_4()
{
    clear
    while ($true)
    {
		clear
        write-host
        $delete_name = Read-Host -Prompt 'Enter the full name, "1" to view names or "Q" to quit'
        $delete_name = (Get-Culture).TextInfo.ToTitleCase($delete_name.ToLower())
        if($delete_name -eq "Q")
        {
            break
        }
        if($delete_name -eq "1")
        {
            option_1 $name_list
            continue
        }

        #delete the name
        $tempArray = @()
        $deleted_location = $name_list.IndexOf($delete_name)

        if($deleted_location -eq -1)
        {
            cls
            write-host "That name was not found.  Press Enter to continue."
            read-host
            continue
        }

        for($i = 0;$i -lt $deleted_location;$i++)
        {
             $tempArray += $name_list[$i]
             
        }
        for($i = $deleted_location+1;$i -lt $name_list.Length;$i++)
        {
            $tempArray += $name_list[$i]
        }
        $global:name_list = @()
        foreach ($i in $temparray)
        {
            $global:name_list += $i

        }        

        write-host
        write-host "$delete_name has been deleted"  
        write-host "`r`nPress Enter to return to the previous menu"
        read-host
        #return $tempArray





    }




}

While ($true)
{
    clear
    write-host "
Please select from the following options:

    1.  List all names starting with one or more letters of the first name
    2.  List all names starting with one or more letters of the last name
    3.  Add a name
    4.  Delete a name
    5.  Exit"

    $user_menu_choice = Read-Host -Prompt "`r`nOption #"

    if ($user_menu_choice -eq "1")
    {
        option_1
        continue
    }
    elseif ($user_menu_choice -eq "2")
    {
        option_2
        continue
    }
    elseif ($user_menu_choice -eq "3")
    {
        option_3
        continue
    }
    elseif ($user_menu_choice -eq "4")
    {
        option_4 -name_list $name_list
        continue
    }
    elseif ($user_menu_choice -eq "5")
    {
        break
    }
    else
    {
        write-host "`r`nThat is not a valid option.  Please try again."
        continue
    }
}