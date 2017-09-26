public class TestController {
    public string firstName {get; set;}
    public string lastName {get; set;}
    public string company {get; set;}
    public string email {get; set;}
    public string qp;
    
    
    public TestController(){
        this.qp = ApexPages.currentPage().getParameters().get('qp');
        
    }
    
    public PageReference Save(){
        PageReference p = null;
        system.debug('==>'+this.qp);
        if( this.qp == null || !'yyyy'.equals(this.qp)){
            p = Page.failure;
            p.getParameters().put('error', 'no param');
        }else{
            try{
                Lead l = new Lead(FirstName = this.FirstName,
                         LastName= this.LastName,
                         Company=this.Company,
                         Email= this.email);
        		insert l;
            }catch(Exception e){
                p=page.failure;
                p.getParameters().put('error', 'no Insert');
                
            }
            
        }
        
            
        if(p == null)
            p = page.success;
        return p;
        
    }


}