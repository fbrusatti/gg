GG
==

## Migrate

###clean up your database
```delete from categories;

```ALTER SEQUENCE photos_id_seq RESTART WITH 1;

####configure your paths

#
	## lib/taks/populate_locations.rake
    # file = "your_path_.csv"

####run migration

* rake db:fill_money_vat
* rake db:populate_locations 
* rake db:seed
