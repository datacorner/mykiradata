/* 
 * Copyright (C) 2017 Benoit CAYLA (benoit@famillecayla.fr)
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

/**
 * Modify the <i> tag to display a glyphe
 * @param {type} name           Glyphe name
 * @param {type} placeHolderID  <I id="?"> id of the place holder
 * @param {type} params         Array of parameters (application given)
 * @returns {undefined}         Nothing
 */
function setGlypheToID(name, placeHolderID, params) {
    var glyphes = params.ApplicationIconsBSGlyphe;
    for (var i=0; i < glyphes.length; i++) {
        if (glyphes[i].name == name) {
            var myObject = document.getElementById(placeHolderID);
            myObject.classList.add("fa");
            myObject.classList.add(glyphes[i].value);
            myObject.classList.add("fa-fw");
            return;
        }
    }
}

function getGlyphe(name, params) {
    var glyphes = params.ApplicationIconsBSGlyphe;
    for (var i=0; i < glyphes.length; i++) {
        if (glyphes[i].name == name) {
            return glyphes[i].value;
        }
    }
    return null;
}

/**
 * Modify the <i> tag to display a glyphe for all the object with the class
 * @param {type} name           Glyphe name
 * @param {type} className      <I class="?"> class of the place holder
 * @param {type} params         Array of parameters (application given)
 * @returns {undefined}         Nothing
 */
function setGlypheToClass(name, className, params) {
    var glyphes = params.ApplicationIconsBSGlyphe;
    var goodGlyphe = "";
    
    // search for the good glyphe code
    for (var i=0; i < glyphes.length; i++) {
        if (glyphes[i].name == name) 
            goodGlyphe = glyphes[i].value;
    }
    
    // Search for all the <i> with the class specified
    var myObjectClasses = document.getElementsByClassName(className);
    for (var j=0; j < myObjectClasses.length; j++) {
        myObjectClasses[j].classList.add("fa");
        myObjectClasses[j].classList.add(goodGlyphe);
        myObjectClasses[j].classList.add("fa-fw");
    }
}

/**
 * Dynamically build the combobox items with the JSON Object (coming from standard Joy REST API)
 * @param {type} selectID   ID of the <select> tag
 * @param {type} data       JSON object which contains data
 * @returns {undefined}     Nothing
 */
function fillComboboxFromJoyVector(selectID, data, orderText, orderValue) {
    var oText, oValue;
    var cboObject = document.getElementById(selectID);
    if (orderText == null) oText = 1; else oText = orderText;
    if (orderValue == null) oValue = 0;  else oValue = orderValue;
    for (var i=0; i < data.rowcount; i++) {
        var myoption = document.createElement("option");
        myoption.text = data.rows[i].items[oText].value;
        myoption.value = data.rows[i].items[oValue].value;
        //cboObject.value = vector.selected;
        cboObject.add(myoption, null);
    }
}

/**
 * Retrieve a specific value from a dataset in JSON format
 * example : {"name":"ICON","value":"pin.png"},{"name":"IMGICO","value":"pin.png"}
 * @param {type} content    json dataset
 * @param {type} fieldname  field to get (ex. ICON)
 * @returns {Window.value}  value
 */
function getFromJoy(content, fieldname) {
    for (var i=0; i < content.length; i++) {
        if (content[i].name == fieldname)
            return content[i].value;
    }
    return null;
}

/**
 * Modify a <A> href tag to add a onClick callback to call joyNavigate function
 * @param {type} aId Tag ID
 * @param {type} tag MVC tag
 */
function makeHref(aId, tag) {
    document.getElementById(aId).href = "#";
    document.getElementById(aId).addEventListener("click", function() { joyNavigate(tag) }, false); 
}

/**
 * Joy single values to set to the <SPAN> tags
 * @param {type} singles values
 */
function setJoyFieldValues(singles) {
    var spans = document.getElementsByTagName("span");
    for (var i=0; i < spans.length; i++) {
        for (var j=0; j < singles.length; j++) {
            if (spans[i].id.toUpperCase() == singles[j].name.toUpperCase()) {
                spans[i].innerHTML = singles[j].value;
            }
        }
    }
}