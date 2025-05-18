#!/bin/bash

function add_user(){
    read -p "Please enter username: " username
    id ${username} &> /dev/null
    if [ $? == 0 ]
    then
        echo "User already exists."
        grep ${username} /etc/passwd
    else
        sudo useradd ${username}
        echo "User added"
        id ${username}
    fi
}
#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function delete_user(){
    read -p "Please enter username: " delete_username
    id ${delete_username} &> /dev/null
    if [ $? == 0 ]
    then
        sudo userdel ${delete_username}
        echo "User deleted"
    else
        echo "Username does not exist."
    fi
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function nologin_user(){
    read -p "Please enter username: " nologin_username
    id ${nologin_username} &> /dev/null
    if [ $? == 0 ]
    then
        sudo usermod -s /usr/sbin/nologin ${nologin_username}
        echo "Done, User can not login"
        grep ${nologin_username} /etc/passwd
    else
        echo "The user do not exists."
    fi    
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function lock_user(){
    read -p "Please enter username: " lock_username
    id ${lock_username} &> /dev/null
    if [ $? == 0 ]
    then
        sudo passwd -l ${lock_username}
        echo "User locked"
        sudo passwd -S ${lock_username}
    else
        echo "The user do not exists."
    fi    
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function unlock_user(){
    read -p "Please enter username: " unlock_username
    id ${unlock_username} &> /dev/null
    if [ $? == 0 ]
    then
        sudo passwd -u ${unlock_username}
        echo "User unlocked"
        sudo passwd -S ${unlock_username}
    else
        echo "The user do not exists."
    fi    
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function change_user_password(){
    read -p "Please enter username: " pusername
    id ${pusername} &> /dev/null
    if [ $? == 0 ]
    then
        sudo passwd ${pusername}
    else
        echo "The user do not exists."
    fi    
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function user_details(){
    read -p "Please enter username: " username_details
    id ${username_details} &> /dev/null
    if [ $? == 0 ]
    then
        id ${username_details}
    else
        echo "The user do not exists."
    fi    
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_groups-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function add_group(){
    read -p "Please enter Groupname: " groupname
    grep ${groupname} /etc/group &> /dev/null
    if [ $? == 0 ]
    then
        echo "The group already exists."
        grep ${groupname} /etc/group
    else
        sudo groupadd ${groupname}
        echo "Group added"
        grep ${groupname} /etc/group
    fi
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function delete_group(){
    read -p "Please enter Group: " delete_group
    grep ${delete_group} /etc/group &> /dev/null
    if [ $? == 0 ]
    then
        sudo groupdel ${delete_group}
        echo "Group deleted"
    else
        echo "Group do not exists."
    fi
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function list_group(){
    tail /etc/group
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function add_user_to_group(){
    read -p "Please enter username: " username
    read -p "Please enter groupname: " groupname
    id ${username} &> /dev/null
    if [ $? == 0 ]
    then

        grep ${groupname} /etc/group &> /dev/null
        if [ $? == 0 ]
        then
            sudo usermod ${username} -aG ${groupname}
            echo "User added"
            id ${username}
        else
            echo "Group does not exist."
        fi

    else
        echo "Username does not exist."
    fi
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function delete_user_from_group(){
    read -p "Please enter username: " username
    read -p "Please enter groupname: " groupname
    id ${username} &> /dev/null
    if [ $? == 0 ]
    then

        grep ${groupname} /etc/group &> /dev/null
        if [ $? == 0 ]
        then
            sudo gpasswd -d ${username} ${groupname}
            id ${username}
        else
            echo "Group does not exist."
        fi

    else
        echo "Username does not exist."
    fi
}


#-_-_-_-_-__-_-_-File and Permissions Management-_-_-_--_-_-_-_-_-_-

function create_file(){
    read -p "Please type full path and file name " filename
    sudo touch ${filename}
    echo "File added"
    ls -l ${filename}
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function create_directory(){
    read -p "Please type full path and directory name " dirname
    sudo mkdir ${dirname}
    echo "Directory added"
    ls -ld ${directory}
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function delete_file(){
    read -p "Please type full path and file name: " filename
    sudo rm -rf ${filename}
    echo "File deleted"
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function delete_directory(){
    read -p "Please type full path and directory name: " dirname
    sudo rm -rf ${dirname}
    echo "Directory deleted"
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function search_for_file(){
    read -p "Please type file name: " filename
    sudo find / -name "${filename}" 2> /dev/null
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function search_for_dire(){
    read -p "Please type directory name: " direname
    sudo find / -type d -name ${direname} 2> /dev/null

}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function change_file_permission() {
    read -p "Please enter file name: " name
    read -p "Please enter numeric permission like this(755): " permission
    
    filepath=$(sudo find / -name "$name" 2>/dev/null | head -n 1)

    if [ -n "$filepath" ]
    then
        sudo chmod "$permission" "$filepath"
        echo "Permission changed for: $filepath"
        ls -l "$filepath"
    else
        echo "File not found"
    fi
}

#-_-_-_-_-_-_-_-_-_-_System Status-_-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-

function task_manager(){
    top
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function disk_status(){
    df -h
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

function kill_process() {
    read -p "Please enter process name: " name
    pids=$(pidof ${name})

    if [ -n ${pids} ]
    then
        echo "process ${name} ID is: ${pids}"
        sudo kill -9 $pids
        echo "Process ${name} killed."
    else
        echo "Process ${name} not found."
    fi
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

echo "Welcome to the Admin Toollist"

select choice in "Add User" "Delete User" "Make User Nologin" "Lock User" "Unlock User" "Change User Password" "User Details" "Add Group" "Delete Group" "List Groups" "Add User to Group" "Remove User from Group" "Create File" "Create Directory" "Delete File" "Delete Directory" "Search File" "Search Directory" "Change File Permission" "Task Manager" "Disk Status" "Kill Process" "Exit"

do
    case $choice in
        "Add User")
            add_user
        ;;
        "Delete User")
            delete_user
        ;;
        "Make User Nologin")
            nologin_user
        ;;
        "Lock User")
            lock_user
        ;;
        "Unlock User")
            unlock_user
        ;;
        "Change User Password")
            change_user_password
        ;;
        "User Details")
            user_details
        ;;
        "Add Group")
            add_group
        ;;
        "Delete Group")
            delete_group
        ;;
        "List Groups")
            list_group
        ;;
        "Add User to Group")
            add_user_to_group
        ;;
        "Remove User from Group")
            delete_user_from_group
        ;;
        "Create File")
            create_file
        ;;
        "Create Directory")
            create_directory
        ;;
        "Delete File")
            delete_file
        ;;
        "Delete Directory")
            delete_directory
        ;;
        "Search File")
            search_for_file
        ;;
        "Search Directory")
            search_for_dire
        ;;
        "Change File Permission")
            change_file_permission
        ;;
        "Task Manager") 
            task_manager
        ;;
        "Disk Status")
            disk_status
        ;;
        "Kill Process")
            kill_process
        ;;
        "Exit")
            echo "Goodbye "; exit
        ;;
        *)
            echo "Invalid option. Please choose a valid number."
        ;;
    esac
done
