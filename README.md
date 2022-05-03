
# TEST BACK
## Requirements
* ruby 2.7.3
* psql (PostgreSQL) 11.0  
## Setup
### Dependencies

```bash  
bundle install  
```

### Database creation  
  
```bash  
bundle exec rake db:create  
bundle exec rake db:migrate  
```  

### Run

```bash  
rails s -p 3001
```  
