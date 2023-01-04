#! /bin/bash

# Get folder name from user
read -p 'Please insert folder name: ' parent_folder

# create folder with name which is given by user
mkdir $parent_folder

# go to the folder
cd $(echo $parent_folder | tr -d '\r')

# create mvc project
dotnet new mvc

# create sln file
dotnet new sln

# add csproj file to sln
dotnet sln add $(echo $parent_folder | tr -d '\r').csproj

# add package(s) to project
dotnet add package Microsoft.EntityFrameworkCore

# go to Models folder for creaeting class(es)
cd Models

# get class(es) name from user
echo "Please insert name of class(es):"

read -a names

# creating class(es) dynamic
for item in "${names[@]}"
do
    type nul > $(echo $item | tr -d '\r').cs
    echo "public class $item { }" > $(echo $item | tr -d '\r').cs
done