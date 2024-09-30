# gphoto_takeout

Making public a basic script to help friends download Google Takeout for Google Photos.

Pretty easy to run @ friends:
1. Download all your Takeout files, should be saved in "Downloads" as "Takeout" folders
2. Open Terminal and paste
  ```
  gh repo clone adam1brownell/gphoto_takeout
  cd gphoto_takeout
  chmod +x move_gphotos.sh
  move_gphotos.sh
  ```
This should save all your photos into a folder called "GPhotos" on your Desktop!

TODO:
* Add selenium script to just rip/download all these files because manually clicking 100+ takeouts is annoying...
* Set up automated way to upload to GDrive?
