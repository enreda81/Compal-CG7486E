Because the Compal CG7486E router provided by my Internet access provider, Vodafone, is blocked recurrently, I created the following bash script that is responsible for rebooting the router.
The Script tries to ping one of Google's DNS, if it does not get a response, it performs a reset of the router.
I have this script programmed by a cron task every 30 minutes.