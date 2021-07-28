package beanweb;


import java.util.List;

import controller.GestisciEventiController;
import entity.EventTab;


public class GestisciEventiBoundary {

	private GestisciEventiController gestEventC;
	private int idShop;
	
	private EventTab event;
	
	EmailBoundary email = null;
	
	private static GestisciEventiBoundary instance = null;

	public static GestisciEventiBoundary getInstance(){
		if ( instance == null) {
			instance = new GestisciEventiBoundary();
		}
		return instance;
	}
		
	   
	   public void contattaCaritas() {
		   email = email.getInstance();
	        email.loadEmail(this.idShop, this.event.getIdCaritas());  	
	   }  	
	    

	    
	   public boolean eliminaEvento(String i) {
		   if (i == null || i.equals("")) {
			   return false;
		   }
		   else {
			  gestEventC.cancellaEvento(Integer.parseInt(i)); 
			  return true;
		   }
	    }


	private GestisciEventiBoundary() {
		gestEventC = new GestisciEventiController();

	}

	public GestisciEventiBoundary(int i) {
		gestEventC = new GestisciEventiController();
		this.idShop = i;

	}
	
	public List<EventTab> loadShopBoundary(){
		return gestEventC.caricaEventi(idShop);
	}
	

	public void loadShopBean(int idShop) {
		this.idShop = idShop;
	}
	



	

}