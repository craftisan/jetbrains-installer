# Jetbrains Installer

## USAGE

1. Open terminal.


2. Go the downloaded location of this installer (Usually in the Downloads directory)
	```shell
	cd ~/Downloads/jetbains-installer
	```
 

3. Run `jetbrains.sh` without sudo with the JetBrains product you want to install

	**JetBrains products support**: PhpStorm, WebStorm, PyCharm etc.

	```shell
	chmod 775 jetbrains.sh
	./jetbrains.sh -p <jetbrains-product-name>

	# example:
	# ./jetbrains.sh -p PhpStorm
	```


4. After running the above command, enter your password whenever asked.


5. Installer will also ask for Administration Access for your terminal. Click `OK` when prompted.

	This access is required if you want to enable auto-renewal of your product. It only makes a cron entry for scheduling renewal, nothing harmful is done.


6. Search the app from `Spotlight Search` or go to the `/Applications` directory and search for `<Product>.app` and run the app.


7. When asked for `Data Sharing`, click `Dont't Send`.


8. When asked `Import PhpStorm Settings`, if you have any settings saved beforehand select 'Config or installation directory' and import setting otherwise select `Do not import settings` and click `OK`.


9. On the `License Activation` screen, Select `Evaluate for free`, leave everything unchecked and click `Evaluate`.


10. DONE!

## BONUS
Your installation will renew after every 20 days! Hence, this installer does not require any activation code or license server.

## NOTE
If you do not provide Administrator Access, your installation will not be auto-renewed and will expire after 30 days.

## SUPPORT
If you have any queries or are facing any problems with the installation, raise an issue here, and I will be more than happy to help.
