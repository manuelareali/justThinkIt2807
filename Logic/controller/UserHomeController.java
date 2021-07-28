package controller;

import dao.UserDao;
import dao.VolunteerRepository;
import entity.VolunteerUser;



public  class UserHomeController{
	
	
	
	public UserHomeController() {
		//default
	}
	
	
	public void helpButtonPressed() {
		//  da fare
		
		
	}

	public void deleteAccount(int id) {
		UserDao userd = new UserDao();
		userd.deleteVolunteer(id);
		
	}
	
	
	public void initDataCont(int id, Object userHomeBoundary) {
		VolunteerRepository userD = new VolunteerRepository();
		VolunteerUser user = userD.getVolunteerByID(id);
		if(userHomeBoundary.getClass() ==  bean.UserHomeBoundary.class) {
			((bean.UserHomeBoundary) userHomeBoundary).initData(user.getNome(), user.getCognome(), user.getId());
		}
		else if(userHomeBoundary.getClass() == beanweb.UserHomeBoundary.class){
			((beanweb.UserHomeBoundary) userHomeBoundary).getInstance().initData(user.getId(),user.getCognome(), user.getNome());
		}
    }


}