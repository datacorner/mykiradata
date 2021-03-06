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
package com.dgm.tasks.load;

import com.joy.JOY;
import com.joy.tasks.JoyTaskStatus;

/**
 *
 * @author Benoit CAYLA (benoit@famillecayla.fr)
 */
public class TASKDtmPurge extends TASKCommonRAZ {

    @Override
    protected void dimensionsInit() {
        super.dimensionsInit();
    }
    
    @Override
    public JoyTaskStatus taskExecute() {
        try {
            // Empty all the tables (fact + dim)
            dtmPurge();
            // Initialize the dimensions
            dimensionsInit();
            
            super.taskExecute();
            this.setMessage("DataMart reinitialized successfully");
            
        } catch (Exception e) {
            getLog().severe(e.toString());
            this.setMessage(e.toString());
            return JoyTaskStatus.Failed;
        }
        return JoyTaskStatus.Success;
    }
    
}
