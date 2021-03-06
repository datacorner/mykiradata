/*
 * Copyright (C) 2016 Benoit CAYLA (benoit@famillecayla.fr)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.dgm.form.manage;

import com.joy.JOY;
import com.joy.bo.BOEntityReadWrite;
import com.joy.mvc.actionTypes.ActionTypeForm;
import com.joy.mvc.formbean.JoyFormMatrix;
import com.joy.mvc.formbean.JoyFormVector;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.joy.bo.IEntity;

/**
 *
 * @author Benoit CAYLA (benoit@famillecayla.fr)
 */
public class RelScContextAction  extends ActionTypeForm {

    @Override
    public String list() {
        JoyFormMatrix matrix = new JoyFormMatrix();
        try {
            IEntity Entity = this.getBOFactory().getEntity("REL_SC_CONTEXT");
            ResultSet rs = Entity.select();
            while (rs.next()) {
                JoyFormVector columns = new JoyFormVector();
                columns.addItem("SCX_PK", rs.getString("SCX_PK"));
                columns.addItem("SCO_NAME", rs.getString("SCO_NAME"));
                columns.addItem("CON_DESCRIPTION", rs.getString("CON_DESCRIPTION"));
                columns.addItem("SCX_DESCRIPTION", rs.getString("SCX_DESCRIPTION"));
                matrix.addRow(columns);
            }
            this.getBOFactory().closeResultSet(rs);

        } catch (SQLException e) {
            JOY.LOG().error( e);
        }
        this.addMatrix("LIST", matrix);
        return super.list(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String edit() {
        String uid = getStrArgumentValue("SCX_PK");
        if (!uid.equalsIgnoreCase("")) {
            try {
                IEntity Entity = this.getBOFactory().getEntity("REL_SC_CONTEXT");
                Entity.reset();
                Entity.field("SCX_PK").setKeyValue(Integer.parseInt(uid));
                ResultSet rs = Entity.select();

                if (rs.next()) {
                    this.addSingle("SCX_PK", rs.getString("SCX_PK"));
                    this.addSingle("SCO_NAME", rs.getString("SCO_NAME"));
                    this.addSingle("CON_DESCRIPTION", rs.getString("CON_DESCRIPTION"));
                    this.addSingle("SCX_DESCRIPTION", rs.getString("SCX_DESCRIPTION"));
                }
                this.getBOFactory().closeResultSet(rs);

            } catch (SQLException e) {
                JOY.LOG().error( e);
            }
        }
        
        loadCBOAvailableContexts(this.getSingle("CON_DESCRIPTION").getStrValue());
        loadCBOAvailableScorecards(this.getSingle("SCO_NAME").getStrValue());
        return super.edit(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String other() {
        return this.list();
    }

    @Override
    public String add() {
        this.addSingle("SCX_PK", "0");
        this.addSingle("CON_DESCRIPTION", "");
        this.addSingle("SCX_DESCRIPTION", "");
        loadCBOAvailableContexts("");
        loadCBOAvailableScorecards("");
        return super.add(); 
    }

    @Override
    public String delete() {
        BOEntityReadWrite Entity = (BOEntityReadWrite)this.getBOFactory().getEntity("REL_SC_CONTEXT");
        int uid = getIntArgumentValue("SCX_PK");
        if (uid != 0) {
            Entity.reset();
            Entity.field("SCX_PK").setKeyValue(uid);
            Entity.delete();
        }
        return this.list();
    }

    @Override
    public String update() {
        int uid = getIntArgumentValue("SCX_PK"); 
        
    	try {
            IEntity Entity = (BOEntityReadWrite)this.getBOFactory().getEntity("REL_SC_CONTEXT");
            Entity.reset();
            Entity.field("SCO_NAME").setValue(getStrArgumentValue("SCO_NAME"));
            Entity.field("SCX_DESCRIPTION").setValue(getStrArgumentValue("SCX_DESCRIPTION"));
            Entity.field("CON_DESCRIPTION").setValue(getStrArgumentValue("CON_DESCRIPTION"));
            if (uid == 0) {
                int newid = Entity.getNewIDForField("SCX_PK");
                Entity.field("SCX_PK").setValue(newid);
                Entity.insert();
            } else {
                Entity.field("SCX_PK").setKeyValue(uid);
                Entity.update();
            } 
            
        } catch (Exception e) {
            JOY.LOG().error( e);
        }
        return this.list();
    }
    
    private void loadCBOAvailableContexts(String _selected) {
        JoyFormVector columns = new JoyFormVector();
        try {
            IEntity EntitySrcContext = this.getBOFactory().getEntity("SRC_CONTEXT");
            EntitySrcContext.addSort("CON_DESCRIPTION");
            ResultSet rs = EntitySrcContext.select();
            columns.setSelected(_selected);
            
            while (rs.next()) {
                columns.addItem("CON_DESCRIPTION", rs.getString("CON_DESCRIPTION"));
            }
            this.getBOFactory().closeResultSet(rs);
            
        } catch (SQLException e) {
            JOY.LOG().error( e);
        }
        this.addVector("CON_DESCRIPTION", columns);
    }
    
    private void loadCBOAvailableScorecards(String CurrentScorecard) {
        JoyFormVector columns = new JoyFormVector();
        
        try {
            IEntity EntitySrcContext = this.getBOFactory().getEntity("Scorecard Dimension");
            EntitySrcContext.addSort("SCO_NAME");
            EntitySrcContext.addFilter("SCO_NAME NOT IN (SELECT SCO_NAME FROM REL_SC_CONTEXT)");
            ResultSet rs = EntitySrcContext.select();
            columns.setSelected(CurrentScorecard);
            
            while (rs.next()) {
                columns.addItem("SCO_NAME", rs.getString("SCO_NAME"));
            }
            if (!CurrentScorecard.isEmpty())
                columns.addItem("SCO_NAME", CurrentScorecard);
            this.getBOFactory().closeResultSet(rs);
            
        } catch (SQLException e) {
            JOY.LOG().error( e);
        }
        this.addVector("SCO_NAME", columns);
    }
    
}
