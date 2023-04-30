#Javi Silva

import os,getpass

#make a path to the active desktop
the_desktop = os.path.join('C:\\Users',getpass.getuser(),'Desktop')
os.chdir(the_desktop)

#set up my .csv output file with column headers
#write is destructive so I don't need to check to see if the file exists
with open ('alert_data.csv','w') as storage: 
    storage.write('Date,Time,Priority,Classification,Description,Source IP,Destination IP\n')

#read the pcap file, extract data, write to my .csv output file
with open ('alert.fast.maccdc2012_00000.pcap') as data_file:
            for i in data_file:
                split1 = i.split('[**]')
                date_time = split1[0]           #date/time
                attack_date = date_time[:5]     #date
                attack_time = date_time[6:11]   #time
                split2 = split1[1].split('] ')
                description = split2[1].strip() #description
                split3 = split1[2].split('] [')
                classification = split3[0]
                classification = classification.strip(' [')
                classification = classification[16:]            #classification
                split4 = split3[1].split('] ')
                priority = split4[0].strip()
                priority = priority[-1]         #priority
                split5 = split4[1].split('} ')
                protocol = split5[0]
                protocol = protocol.strip('{ ') #protocol
                ip_addresses_string = split5[1]
                ip_addresses_list = ip_addresses_string.split(' -> ')
                source_ip = ip_addresses_list[0].strip()        #source ip
                destination_ip = ip_addresses_list[1].strip()   #destination ip
                with open ('alert_data.csv','a') as storage:
                    storage.write(attack_date + ','
                                  + attack_time + ','
                                  + priority + ','
                                  + classification + ','
                                  + description + ','
                                  + source_ip + ','
                                  + destination_ip + '\n')

input('Processing is done.  Press enter to close the script.')

            


                    
            



