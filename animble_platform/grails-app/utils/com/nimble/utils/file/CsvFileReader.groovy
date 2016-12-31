/*

aNimble Platform: Application Lifecycle Management Tool
Copyright (C) 2010-2012 ideaStub, LLC

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

*/

package com.nimble.utils.file;

import java.text.SimpleDateFormat
 
class CsvFileReader {
 
    CsvFileReader(def fileName) {
        this.fileName = fileName
    }
 
    def fileName
 
    def dateFormat = /\d{1,2}-\d{1,2}-\d{2,4} \d{1,2}:\d{1,2}(:\d{1,2}){0,1}/
    //def dateTimeFormat = /\d{1,2}-\d{1,2}-\d{2,4} \d{1,2}:\d{1,2}(:\d{1,2}){0,1}/
    def dateTimeFormat = /\d{1,2}\/\d{1,2}\/\d{2,4} \d{1,2}:\d{1,2}(:\d{1,2}){0,1}/
    def currencyFormat = /\$(\d)*(.){0,1}(\d)+/
 
    def nullIfEmpty = { instr ->
            return instr == ''? null: instr
        }
 
    def df = new SimpleDateFormat('MM/dd/yyyy') //('dd-MM-yyyy')
 
    def forEachRow(forEachRowCallBack) {
 
        def idx = 0
        def items
 
        def headingRow = true //  to differentiate the first row, set to false
        def header = []
        def values = [ : ]
        def columnIdx
 
        new File(fileName).eachLine() { fields ->
 
			// This reads comma separated line and puts it into a hashmap
			//	It skips commas that are within double quotes
            items = fields.split(/,(?=([^"]*"[^"]*")*(?![^"]*"))/)*.replaceAll(/"/, "")
 
// now we check for the headingRow being true only for the first time, 
// and immediately set it to false for subsequent rows!
 
            if (headingRow) {
                     headingRow = false
                     header = items
                }
 
            else {
 
                columnIdx = 0
 
                //  return the values in a map of header name and column names
                header.each {
 
                    values[it] = items[columnIdx++]
 
                    //  convert any dates into date objects
                    if (values[it] ==~ dateTimeFormat) {
                        //  convert date to date object
                        // println "matched date format"
                        values[it] = df.parse(values[it])
                        //println values[it] 
                    }
                    else if (values[it] ==~ currencyFormat) {
                        //  convert currency to decimal object
                        // println "matched currency format"
                        values[it] = new BigDecimal(values[it].substring(1))
                        //println values[it]
                    }
                    else {
                        //  convert any empty strings to nulls
                        values[it] = nullIfEmpty(values[it])
                        //println values[it]
                    }
                }
 
                forEachRowCallBack(values)
            }
        }
    }
}