package dselectkey.dao;

import java.util.ArrayList;

public interface DSelectKeyDAO {

	public ArrayList<String> makeSearchList(String searchWordFromAjax) throws Exception;

}
