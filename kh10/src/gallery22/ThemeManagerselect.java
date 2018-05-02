package gallery22;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.sql.SQLException;



public class ThemeManagerselect {
	
    private static ThemeManagerselect instance = new ThemeManagerselect();
   
    public static ThemeManagerselect getInstance() {
        return instance;
    }
   
    private ThemeManagerselect() {}
    
    private Connection getConnection() throws Exception {
        return DriverManager.getConnection("jdbc:apache:commons:dbcp:/pool");
    }
	
	
	//목록을 읽어오는 메서드
	public List selectList(List whereCond, Map valueMap, int startRow, int endRow) throws Exception  {
		if(valueMap == null) valueMap = Collections.EMPTY_MAP;
		
		Connection conn  = null;
		PreparedStatement pstmtMessage = null;
		ResultSet rsMessage = null;
		
		try {
			StringBuffer query = new StringBuffer(200);
			
			query.append("select * from( ");
			query.append(" select THEME_MESSAGE_ID,GROUP_ID,ORDER_NO,LEVELS,PARENT_ID,REGISTER,NAME,EMAIL,IMAGE,PASSWORD,TITLE,ROWNUM rnum ");
			query.append(" from( ");
			query.append(" select THEME_MESSAGE_ID, GROUP_ID,ORDER_NO,LEVELS,PARENT_ID,REGISTER,NAME,EMAIL,IMAGE,PASSWORD,TITLE ");
			query.append(" from THEME_MESSAHE_PINK ");
			
			if(whereCond != null && whereCond.size() > 0) {
				query.append("where ");
				for(int i=0;i<whereCond.size() ; i++) {
					query.append(whereCond.get(i));
					if(i < whereCond.size() -1) {
						query.append(" or ");
				}
			}
		}
		query.append(" order by GROUP_ID desc, ORDER_NO asc ");
		query.append(" ) where ROWNUM <= ? ");
		query.append(" ) where rnum >= ? ");
		
		conn = getConnection();
		
		pstmtMessage = conn.prepareStatement(query.toString());
		Iterator keyIter  = valueMap.keySet().iterator();
		while(keyIter.hasNext()) {
			Integer key = (Integer)keyIter.next();
			Object obj = valueMap.get(key);
			if(obj instanceof String) {
				pstmtMessage.setString(key.intValue(), (String)obj);
			}
			else if(obj instanceof Integer) {
				pstmtMessage.setInt(key.intValue(), ((Integer)obj).intValue());
			}
			else if(obj instanceof Timestamp) {
				pstmtMessage.setTimestamp(key.intValue(),(Timestamp)obj);
			}
		}
		
		pstmtMessage.setInt(valueMap.size() + 1, endRow +1);
		pstmtMessage.setInt(valueMap.size() + 2, startRow +1);
		
		rsMessage = pstmtMessage.executeQuery();
		if(rsMessage.next()) {
			List list = new java.util.ArrayList(endRow-startRow+1);
			
			do {
				Theme theme = new Theme();
				theme.setId(rsMessage.getInt("THEME_MESSAGE_ID"));
				theme.setGroupId(rsMessage.getInt("GROUP_ID"));
				theme.setOrderNo(rsMessage.getInt("ORDER_NO"));
				theme.setLevels(rsMessage.getInt("LEVELS"));
				theme.setParentId(rsMessage.getInt("PARENT_ID"));
				theme.setRegister(rsMessage.getTimestamp("REGISTER"));
				theme.setName(rsMessage.getString("NAME"));
				theme.setEmail(rsMessage.getString("EMAIL"));
				theme.setImage(rsMessage.getString("IMAGE"));
				theme.setPassword(rsMessage.getString("PASSWORD"));
				theme.setTitle(rsMessage.getString("TITLE"));
				list.add(theme);				
			} while(rsMessage.next());
			
			return list;	
		} else {
			return Collections.EMPTY_LIST;
		}
	} catch (SQLException e) {
		e.printStackTrace();
		throw new Exception("selectList", e);
	} finally {
		if(rsMessage != null) try {rsMessage.close(); } catch (SQLException e) {}
		if(pstmtMessage != null) try {pstmtMessage.close(); } catch (SQLException e) {}	
		if(conn != null) try {conn.close(); } catch (SQLException e) {}
	}

	}
	
	public Theme select(int id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmtMessage = null;
		ResultSet rsMessage = null;
		PreparedStatement pstmtContent = null;
		ResultSet rsContent = null;
		
		try {
			Theme theme = null;
			
			conn = getConnection();
			pstmtMessage = conn.prepareStatement("select * from THEME_MESSAGE_PINK where THEME_MESSAGE_ID = ?");
			pstmtMessage.setInt(1, id);
			rsMessage = pstmtMessage.executeQuery();
			if(rsMessage.next()) {
				theme = new Theme();
				theme.setId(rsMessage.getInt("THEME_MESSAGE_ID"));
				theme.setGroupId(rsMessage.getInt("GROUP_ID"));
				theme.setOrderNo(rsMessage.getInt("ORDER_NO"));
	            theme.setLevels(rsMessage.getInt("LEVELS"));
	            theme.setParentId(rsMessage.getInt("PARENT_ID"));
	            theme.setRegister(rsMessage.getTimestamp("REGISTER"));
	            theme.setName(rsMessage.getString("NAME"));
	            theme.setEmail(rsMessage.getString("EMAIL"));
	            theme.setImage(rsMessage.getString("IMAGE"));
	            theme.setPassword(rsMessage.getString("PASSWORD"));
	            theme.setTitle(rsMessage.getString("TITLE"));
	            
	            pstmtContent = conn.prepareStatement("select CONTENT from THEME_CONTENT_PINK where THEME_MESSAGE_ID = ?");
	            pstmtContent.setInt(1, id);
	            rsContent = pstmtContent.executeQuery();
	            if(rsContent.next()) {
	            	Reader reader = null;
	            	try {
	            		reader = rsContent.getCharacterStream("CONTENT");
	            		char[] buff = new char[512];
	            		int len = -1;
	            		StringBuffer buffer = new StringBuffer(512);
	            		while((len = reader.read(buff)) != -1) {
	            			buffer.append(buff, 0, len);
	            		}
	            		theme.setContent(buffer.toString());
	            	} catch(IOException e) {
	            		throw new Exception("select", e);
	            	} finally {
						if(reader != null) 
							try {
								reader.close();
							} catch (IOException e) {}
					}
	            }
	            else {
	            	return null;
	            }
	            return theme;
			}
			else {
				return null;
			}
		} catch(SQLException e) {
			e.printStackTrace();
			throw new Exception("select", e);
		} finally {
			if(rsMessage != null) try { rsMessage.close(); } catch (SQLException e) {}
			if(pstmtMessage != null) try {pstmtMessage.close(); } catch (SQLException e) {}
			if(rsContent != null) try { rsContent.close(); } catch (SQLException e) {}
			if(pstmtContent != null) try {pstmtContent.close(); } catch (SQLException e) {}
	
		}
	}
}
