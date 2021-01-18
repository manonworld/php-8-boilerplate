.DEFAULT_GOAL := default

.PHONY:
	default install appinstall appuninstall start restart stop clean dockerclean fix

install:
	@clear;
	@echo "";
	@docker-compose down --remove-orphans;
	@docker-compose up -d --build;
	@clear;
	@echo "Infrastrucutre Successfully Installed";
	@echo "";

appinstall:
	@clear;
	@echo "";
	@docker exec -it php composer install;
	@clear;
	@echo "";
	@echo "Application Installed Successfully";
	@echo "";

appuninstall:
	@clear;
	@echo "";
	@docker exec -it php rm -R vendor;
	@clear;
	@echo "";
	@echo "Application Uninstalled Successfully";
	@echo "";


start:
	@clear;
	@echo "";
	@docker exec -it php symfony server:start -d;
	@clear;
	@echo "";
	@echo "";
	@echo "Application Started Successfully.";
	@echo "";
	@echo "Make sure you edit /etc/hosts file and add 127.0.0.1		manon.wip";
	@echo "";
	@echo "Point your browser to https://manon.wip:8000";
	@echo "";
	@echo "";

stop:
	@clear;
	@echo "";
	@docker exec -it php symfony server:stop;
	@clear;
	@echo "";
	@echo "";
	@echo "Application Stopped Successfully.";
	@echo "";
	@echo "";

clean:
	@clear;
	@echo "";
	@docker-compose down --remove-orphans;
	@clear;
	@docker system prune --all -f -a;
	@clear;
	@echo "";
	@echo "Infrastrucutre Successfully Cleaned";
	@echo "";

dockerclean:
	@clear;
	@echo "";
	@docker system prune --all -f -a;
	@clear;
	@echo "Docker Process Successfully Cleaned";

default:
	@clear;
	@echo "";
	@echo "";
	@echo "";
	@echo "The following commands are available";
	@echo "---------------------------------------";
	@echo "";
	@echo "";
	@echo "make install (installs the infrastrucutre)";
	@echo "";
	@echo "make appinstall (installs the application)";
	@echo "";
	@echo "make appuninstall (uninstalls the application)";
	@echo "";
	@echo "make start (restarts the application)";
	@echo "";
	@echo "make stop (stops the applicatioin)";
	@echo "";
	@echo "make restart (restarts the application)";
	@echo "";
	@echo "make clean (cleans the infrastructure)";
	@echo "";
	@echo "make dockerclean (cleans the docker process)";
	@echo "";
	@echo "make fix (fixes the code to PSR2)";
	@echo "";
	@echo "To start the application run the following command make install && make appinstall && make start";
	@echo "";
	@echo "";