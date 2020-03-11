sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx force:source:push
sfdx force:package:install --package 04t0b000001oXug --wait 20 -r
sfdx shane:heroku:repo:deploy -g mshanemc -r heroku-empty -n `basename "${PWD/mshanemc-/}"` -t autodeployed-demos
sfdx shane:ai:playground:setupHeroku -a `basename "${PWD/mshanemc-/}"` -k
sfdx shane:ai:dataset:upload -f assets/imageClassification.zip -n Example --train
sfdx force:org:open -p /lightning/n/einsteinplay__Playground