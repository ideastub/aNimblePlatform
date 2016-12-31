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
 
package com.nimble.service.search

class SearchService {
    boolean transactional = false
    def compass
    def compassGps
    def searchableMethodFactory

    def search(Object[] args) {
        searchableMethodFactory.getMethod("search").invoke(*args)
    }

    def searchEvery(Object[] args) {
        searchableMethodFactory.getMethod("searchEvery").invoke(*args)
    }

    def searchTop(Object[] args) {
        searchableMethodFactory.getMethod("searchTop").invoke(*args)
    }

    def moreLikeThis(Object[] args) {
        searchableMethodFactory.getMethod("moreLikeThis").invoke(*args)
    }

    def countHits(Object[] args) {
        searchableMethodFactory.getMethod("countHits").invoke(*args)
    }

    def termFreqs(Object[] args) {
        searchableMethodFactory.getMethod("termFreqs").invoke(*args)
    }

    def suggestQuery(Object[] args) {
        searchableMethodFactory.getMethod("suggestQuery").invoke(*args)
    }

    def rebuildSpellingSuggestions(options) {
        if (compass.settings.getSetting('compass.engine.spellcheck.enable') != 'true') {
            throw new IllegalStateException(
                "Suggestions are only available when the Compass Spell Check feature is enabled, but currently it is not. " +
                "Please set Compass setting 'compass.engine.spellcheck.enable' to 'true'. " +
                "One way to so this is to use the SearchableConfiguration.groovy file (run \"grails install-searchable-config\") and " +
                "add \"'compass.engine.spellcheck.enable': 'true'\" to the compassSettings Map. " +
                "Also see the Spell Check section in the Compass docs for additional settings."
            )
        }
        def spellCheckManager = compass.getSpellCheckManager()
        if (options?.fork && options?.subIndex) {
            throw new IllegalArgumentException("The \"subIndex\" and \"fork\" options may not used together")
        }
        if (options?.fork) {
            return spellCheckManager.concurrentRebuild()
        }
        if (options?.subIndex) {
            return spellCheckManager.rebuild(options?.subIndex)
        }
        return spellCheckManager.rebuild()
    }

    def indexAll(Object[] args) {
        searchableMethodFactory.getMethod("indexAll").invoke(*args)
    }

    def index(Object[] args) {
        searchableMethodFactory.getMethod("index").invoke(*args)
    }

    def unindexAll(Object[] args) {
        searchableMethodFactory.getMethod("unindexAll").invoke(*args)
    }

    def unindex(Object[] args) {
        searchableMethodFactory.getMethod("unindex").invoke(*args)
    }

    def reindexAll(Object[] args) {
        searchableMethodFactory.getMethod("reindexAll").invoke(*args)
    }

    def reindex(Object[] args) {
        searchableMethodFactory.getMethod("reindex").invoke(*args)
    }

    def startMirroring() {
        compassGps.start()
    }

    def stopMirroring() {
        compassGps.stop()
    }
}
