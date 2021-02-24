# Jetbrains Installer

A simple script to install latest JetBrains IDEs. **No activation code required. No license server required.**


### _Supported JetBrains products:_
PhpStorm, WebStorm, PyCharm


## USAGE

1. Download/clone this source code 


2. Open terminal.


3. Go the downloaded location of this installer (Usually in the Downloads directory)
	```shell
	cd ~/Downloads/jetbains-installer
	```
 

4. Run `jetbrains.sh` without sudo with the JetBrains product you want to install.

	```shell
	chmod 775 jetbrains.sh
	./jetbrains.sh -p <jetbrains-product-name>

	# example:
	# ./jetbrains.sh -p PhpStorm
	```


5. After running the above command, enter your password whenever asked.


6. Installer will also ask for Administration Access for your terminal. Click `OK` when prompted.

	This access is required if you want to enable auto-renewal of your product. It only makes a cron entry for scheduling renewal, nothing harmful is done.


7. Search the app from `Spotlight Search` or go to the `/Applications` directory and search for `<Product>.app` and run the app.


8. When asked for `Data Sharing`, click `Dont't Send`.


9. When asked `Import PhpStorm Settings`, if you have any settings saved beforehand select 'Config or installation directory' and import setting otherwise select `Do not import settings` and click `OK`.


10. On the `License Activation` screen, Select `Evaluate for free`, leave everything unchecked and click `Evaluate`.


11. DONE!

## BONUS
Your installation will renew after every 20 days! Hence, this installer does not require any activation code or license server.

## NOTE
If you do not provide Administrator Access, your installation will not be auto-renewed and will expire after 30 days.

## SUPPORT
If you have any queries or are facing any problems with the installation, raise an issue here, and I will be more than happy to help.
