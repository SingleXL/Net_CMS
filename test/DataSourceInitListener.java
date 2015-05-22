import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

public class DataSourceInitListener  implements ApplicationListener<ContextRefreshedEvent> {
     
    @SuppressWarnings("unchecked")
    @Override
    public void onApplicationEvent(ContextRefreshedEvent ev) {
    	System.out.println(2222);
    	
    	
        //防止重复执行。
        if(ev.getApplicationContext().getParent() == null){
         
             
        }
    }
 
}