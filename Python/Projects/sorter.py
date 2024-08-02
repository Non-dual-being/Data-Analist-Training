import os
import shutil

def organize_files(base_directory):
    
    def get_all_files(directory):
        files = []
        for root, _, filenames in os.walk(directory):
            for filename in filenames:
                files.append(os.path.join(root, filename))
        return files

    def get_extension_map(files):
        extension_map = {}
        for file in files:
            _, extension = os.path.splitext(file)  # Splits de bestandsnaam in naam en extensie
            if extension:  # Controleer of er een extensie is
                folder_name = extension[1:] + " files"  # Verwijder de punt en voeg ' files' toe
                if extension not in extension_map:  # Als de extensie nog niet in de map zit
                    extension_map[extension] = folder_name  # Voeg de extensie en mapnaam toe aan de map
        return extension_map

    def create_directories(base_directory, extension_map):
        for folder_name in extension_map.values():
            folder_path = os.path.join(base_directory, folder_name)
            if not os.path.exists(folder_path):
                os.makedirs(folder_path)
                print(f"Map aangemaakt: {folder_path}")
            else:
                print(f"Map bestaat al: {folder_path}")

    def move_files_to_directories(base_directory, files, extension_map):
        for file in files:
            _, extension = os.path.splitext(file)
            if extension in extension_map:
                dest_folder = os.path.join(base_directory, extension_map[extension])
                dest_file = os.path.join(dest_folder, os.path.basename(file))
                if not os.path.exists(dest_file):
                    shutil.move(file, dest_file)
                    print(f"Bestand verplaatst: {file} -> {dest_folder}")
                else:
                    print(f"Bestand bestaat al in doelmap: {dest_file}")

    # Haal alle bestanden op
    files = get_all_files(base_directory)

    # Maak de mapping van extensies naar mappenamen
    extension_map = get_extension_map(files)

    # Maak de benodigde directories aan
    create_directories(base_directory, extension_map)

    # Verplaats de bestanden naar de corresponderende directories
    move_files_to_directories(base_directory, files, extension_map)

# Voorbeeldgebruik
base_directory = r".\sortmap"
organize_files(base_directory)