/**
 * Copyright (c) 2009-2012, Lukas Eder, lukas.eder@gmail.com
 * All rights reserved.
 *
 * This software is licensed to you under the Apache License, Version 2.0
 * (the "License"); You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * . Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * . Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * . Neither the name "jOOQ" nor the names of its contributors may be
 *   used to endorse or promote products derived from this software without
 *   specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
package org.jooq.xtend

import org.jooq.Constants
import java.util.Collections

/**
 * @author Lukas Eder
 */
class Rows extends Generators {
	
    def static void main(String[] args) {
        val rows = new Rows();
        rows.generateRowClasses();
        rows.generateRowImpl();
    }
    
    def generateRowClasses() {
        for (degree : (1..Constants::MAX_ROW_DEGREE)) {
            val out = new StringBuilder();
            
            out.append('''
            «classHeader»
            package org.jooq;

            import static org.jooq.SQLDialect.CUBRID;
            import static org.jooq.SQLDialect.DB2;
            import static org.jooq.SQLDialect.HSQLDB;
            import static org.jooq.SQLDialect.MYSQL;
            import static org.jooq.SQLDialect.ORACLE;
            import static org.jooq.SQLDialect.POSTGRES;
            
            import java.util.Collection;
            
            import javax.annotation.Generated;
            
            /**
             * A model type for a row value expression with degree <code>«degree»</code>
             * <p>
             * Note: Not all databases support row value expressions, but many row value
             * expression operations can be simulated on all databases. See relevant row
             * value expression method Javadocs for details.
             *
             * @author Lukas Eder
             */
            «generatedAnnotation»
            public interface Row«degree»<«TN(degree)»> extends Row {

                // ------------------------------------------------------------------------
                // Field accessors
                // ------------------------------------------------------------------------
                «FOR d : (1..degree)»

                /**
                 * Get the «first(d)» field
                 */
                Field<T«d»> field«d»();
                   «ENDFOR»

                // ------------------------------------------------------------------------
                // Equal / Not equal comparison predicates
                // ------------------------------------------------------------------------

                /**
                 * Compare this row value expression with another row value expression for
                 * equality
                 * <p>
                 * Row equality comparison predicates can be simulated in those databases
                 * that do not support such predicates natively:
                 * <code>(A, B) = (1, 2)</code> is equivalent to
                 * <code>A = 1 AND B = 2</code>
                 */
                @Support
                Condition equal(Row«degree»<«TN(degree)»> row);
            
                /**
                 * Compare this row value expression with a record for equality
                 *
                 * @see #equal(Row«degree»)
                 */
                @Support
                Condition equal(Record«degree»<«TN(degree)»> record);
            
                /**
                 * Compare this row value expression with another row value expression for
                 * equality
                 *
                 * @see #equal(Row«degree»)
                 */
                @Support
                Condition equal(«TN_tn(degree)»);
            
                /**
                 * Compare this row value expression with another row value expression for
                 * equality
                 *
                 * @see #equal(Row«degree»)
                 */
                @Support
                Condition equal(«Field_TN_tn(degree)»);
            
                /**
                 * Compare this row value expression with a subselect for equality
                 *
                 * @see #equal(Row«degree»)
                 */
                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
                Condition equal(Select<? extends Record«degree»<«TN(degree)»>> select);
            
                /**
                 * Compare this row value expression with another row value expression for
                 * equality
                 *
                 * @see #equal(Row«degree»)
                 */
                @Support
                Condition eq(Row«degree»<«TN(degree)»> row);
            
                /**
                 * Compare this row value expression with a record for equality
                 *
                 * @see #equal(Row«degree»)
                 */
                @Support
                Condition eq(Record«degree»<«TN(degree)»> record);
            
                /**
                 * Compare this row value expression with another row value expression for
                 * equality
                 *
                 * @see #equal(Row«degree»)
                 */
                @Support
                Condition eq(«TN_tn(degree)»);
            
                /**
                 * Compare this row value expression with another row value expression for
                 * equality
                 *
                 * @see #equal(Row«degree»)
                 */
                @Support
                Condition eq(«Field_TN_tn(degree)»);
            
                /**
                 * Compare this row value expression with a subselect for equality
                 *
                 * @see #equal(Row«degree»)
                 */
                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
                Condition eq(Select<? extends Record«degree»<«TN(degree)»>> select);
            
                /**
                 * Compare this row value expression with another row value expression for
                 * non-equality
                 * <p>
                 * Row non-equality comparison predicates can be simulated in those
                 * databases that do not support such predicates natively:
                 * <code>(A, B) <> (1, 2)</code> is equivalent to
                 * <code>NOT(A = 1 AND B = 2)</code>
                 */
                @Support
                Condition notEqual(Row«degree»<«TN(degree)»> row);
            
                /**
                 * Compare this row value expression with a record for non-equality
                 *
                 * @see #notEqual(Row«degree»)
                 */
                @Support
                Condition notEqual(Record«degree»<«TN(degree)»> record);
            
                /**
                 * Compare this row value expression with another row value expression for
                 * non-equality
                 *
                 * @see #notEqual(Row«degree»)
                 */
                @Support
                Condition notEqual(«TN_tn(degree)»);
            
                /**
                 * Compare this row value expression with another row value expression for
                 * non-equality
                 *
                 * @see #notEqual(Row«degree»)
                 */
                @Support
                Condition notEqual(«Field_TN_tn(degree)»);
            
                /**
                 * Compare this row value expression with a subselect for non-equality
                 *
                 * @see #notEqual(Row«degree»)
                 */
                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
                Condition notEqual(Select<? extends Record«degree»<«TN(degree)»>> select);
            
                /**
                 * Compare this row value expression with another row value expression for
                 * non-equality
                 *
                 * @see #notEqual(Row«degree»)
                 */
                @Support
                Condition ne(Row«degree»<«TN(degree)»> row);
            
                /**
                 * Compare this row value expression with a record for non-equality
                 *
                 * @see #notEqual(Row«degree»)
                 */
                @Support
                Condition ne(Record«degree»<«TN(degree)»> record);
            
                /**
                 * Compare this row value expression with another row value expression for
                 * non-equality
                 *
                 * @see #notEqual(Row«degree»)
                 */
                @Support
                Condition ne(«TN_tn(degree)»);
            
                /**
                 * Compare this row value expression with another row value expression for
                 *
                 * @see #notEqual(Row«degree»)
                 */
                @Support
                Condition ne(«Field_TN_tn(degree)»);
            
                /**
                 * Compare this row value expression with a subselect for non-equality
                 *
                 * @see #notEqual(Row«degree»)
                 */
                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
                Condition ne(Select<? extends Record«degree»<«TN(degree)»>> select);
            
                // ------------------------------------------------------------------------
                // Ordering comparison predicates
                // ------------------------------------------------------------------------
            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 * <p>
«««                 * Row order comparison predicates can be simulated in those
«««                 * databases that do not support such predicates natively:
«««                 * <code>(A, B, C) < (1, 2, 3)</code> is equivalent to
«««                 * <code>A < 1 OR (A = 1 AND B < 2) OR (A = 1 AND B = 2 AND C < 3)</code>
«««                 */
«««                @Support
«««                Condition lessThan(Row«degree»<«TN(degree)»> row);
«««            
«««                /**
«««                 * Compare this row value expression with a record for order
«««                 *
«««                 * @see #lessThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition lessThan(Record«degree»<«TN(degree)»> record);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #lessThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition lessThan(«TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #lessThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition lessThan(«Field_TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with a subselect for order
«««                 *
«««                 * @see #lessThan(Row«degree»)
«««                 */
«««                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
«««                Condition lessThan(Select<? extends Record«degree»<«TN(degree)»>> select);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #lessThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition lt(Row«degree»<«TN(degree)»> row);
«««            
«««                /**
«««                 * Compare this row value expression with a record for order
«««                 *
«««                 * @see #lessThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition lt(Record«degree»<«TN(degree)»> record);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #lessThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition lt(«TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #lessThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition lt(«Field_TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with a subselect for order
«««                 *
«««                 * @see #lessThan(Row«degree»)
«««                 */
«««                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
«««                Condition lt(Select<? extends Record«degree»<«TN(degree)»>> select);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 * <p>
«««                 * Row order comparison predicates can be simulated in those
«««                 * databases that do not support such predicates natively:
«««                 * <code>(A, B) <= (1, 2)</code> is equivalent to
«««                 * <code>A < 1 OR (A = 1 AND B < 2) OR (A = 1 AND B = 2)</code>
«««                 */
«««                @Support
«««                Condition lessOrEqual(Row«degree»<«TN(degree)»> row);
«««            
«««                /**
«««                 * Compare this row value expression with a record for order
«««                 *
«««                 * @see #lessOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition lessOrEqual(Record«degree»<«TN(degree)»> record);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #lessOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition lessOrEqual(«TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #lessOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition lessOrEqual(«Field_TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with a subselect for order
«««                 *
«««                 * @see #lessOrEqual(Row«degree»)
«««                 */
«««                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
«««                Condition lessOrEqual(Select<? extends Record«degree»<«TN(degree)»>> select);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #lessOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition le(Row«degree»<«TN(degree)»> row);
«««            
«««                /**
«««                 * Compare this row value expression with a record for order
«««                 *
«««                 * @see #lessOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition le(Record«degree»<«TN(degree)»> record);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #lessOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition le(«TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #lessOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition le(«Field_TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with a subselect for order
«««                 *
«««                 * @see #lessOrEqual(Row«degree»)
«««                 */
«««                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
«««                Condition le(Select<? extends Record«degree»<«TN(degree)»>> select);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 * <p>
«««                 * Row order comparison predicates can be simulated in those
«««                 * databases that do not support such predicates natively:
«««                 * <code>(A, B, C) > (1, 2, 3)</code> is equivalent to
«««                 * <code>A > 1 OR (A = 1 AND B > 2) OR (A = 1 AND B = 2 AND C > 3)</code>
«««                 */
«««                @Support
«««                Condition greaterThan(Row«degree»<«TN(degree)»> row);
«««            
«««                /**
«««                 * Compare this row value expression with a record for order
«««                 *
«««                 * @see #greaterThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition greaterThan(Record«degree»<«TN(degree)»> record);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #greaterThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition greaterThan(«TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #greaterThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition greaterThan(«Field_TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with a subselect for order
«««                 *
«««                 * @see #greaterThan(Row«degree»)
«««                 */
«««                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
«««                Condition greaterThan(Select<? extends Record«degree»<«TN(degree)»>> select);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #greaterThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition gt(Row«degree»<«TN(degree)»> row);
«««            
«««                /**
«««                 * Compare this row value expression with a record for order
«««                 *
«««                 * @see #greaterThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition gt(Record«degree»<«TN(degree)»> record);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #greaterThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition gt(«TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #greaterThan(Row«degree»)
«««                 */
«««                @Support
«««                Condition gt(«Field_TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with a subselect for order
«««                 *
«««                 * @see #greaterThan(Row«degree»)
«««                 */
«««                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
«««                Condition gt(Select<? extends Record«degree»<«TN(degree)»>> select);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 * <p>
«««                 * Row order comparison predicates can be simulated in those
«««                 * databases that do not support such predicates natively:
«««                 * <code>(A, B) >= (1, 2)</code> is equivalent to
«««                 * <code>A > 1 OR (A = 1 AND B > 2) OR (A = 1 AND B = 2)</code>
«««                 */
«««                @Support
«««                Condition greaterOrEqual(Row«degree»<«TN(degree)»> row);
«««            
«««                /**
«««                 * Compare this row value expression with a record for order
«««                 *
«««                 * @see #greaterOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition greaterOrEqual(Record«degree»<«TN(degree)»> record);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #greaterOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition greaterOrEqual(«TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #greaterOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition greaterOrEqual(«Field_TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with a subselect for order
«««                 *
«««                 * @see #greaterOrEqual(Row«degree»)
«««                 */
«««                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
«««                Condition greaterOrEqual(Select<? extends Record«degree»<«TN(degree)»>> select);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #greaterOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition ge(Row«degree»<«TN(degree)»> row);
«««            
«««                /**
«««                 * Compare this row value expression with a record for order
«««                 *
«««                 * @see #greaterOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition ge(Record«degree»<«TN(degree)»> record);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #greaterOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition ge(«TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * order
«««                 *
«««                 * @see #greaterOrEqual(Row«degree»)
«««                 */
«««                @Support
«««                Condition ge(«Field_TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with a subselect for order
«««                 *
«««                 * @see #greaterOrEqual(Row«degree»)
«««                 */
«««                @Support({ CUBRID, HSQLDB, MYSQL, ORACLE, POSTGRES })
«««                Condition ge(Select<? extends Record«degree»<«TN(degree)»>> select);
            
                // ------------------------------------------------------------------------
                // [NOT] DISTINCT predicates
                // ------------------------------------------------------------------------
            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * distinctness
«««                 */
«««                @Support
«««                Condition isDistinctFrom(Row«degree»<«TN(degree)»> row);
«««            
«««                /**
«««                 * Compare this row value expression with a record for distinctness
«««                 *
«««                 * @see #isDistinctFrom(Row«degree»)
«««                 */
«««                @Support
«««                Condition isDistinctFrom(Record«degree»<«TN(degree)»> record);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * distinctness
«««                 *
«««                 * @see #isDistinctFrom(Row«degree»)
«««                 */
«««                @Support
«««                Condition isDistinctFrom(«TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * distinctness
«««                 *
«««                 * @see #isDistinctFrom(Row«degree»)
«««                 */
«««                @Support
«««                Condition isDistinctFrom(«Field_TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * non-distinctness
«««                 */
«««                @Support
«««                Condition isNotDistinctFrom(Row«degree»<«TN(degree)»> row);
«««            
«««                /**
«««                 * Compare this row value expression with a record for non-distinctness
«««                 *
«««                 * @see #isNotDistinctFrom(Row«degree»)
«««                 */
«««                @Support
«««                Condition isNotDistinctFrom(Record«degree»<«TN(degree)»> record);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * non-distinctness
«««                 *
«««                 * @see #isNotDistinctFrom(Row«degree»)
«««                 */
«««                @Support
«««                Condition isNotDistinctFrom(«TN_tn(degree)»);
«««            
«««                /**
«««                 * Compare this row value expression with another row value expression for
«««                 * non-distinctness
«««                 *
«««                 * @see #isNotDistinctFrom(Row«degree»)
«««                 */
«««                @Support
«««                Condition isNotDistinctFrom(«Field_TN_tn(degree)»);
            
                // ------------------------------------------------------------------------
                // [NOT] IN predicates
                // ------------------------------------------------------------------------
            
                /**
                 * Compare this row value expression with a set of row value expressions for
                 * equality
                 * <p>
                 * Row IN predicates can be simulated in those databases that do not support
                 * such predicates natively: <code>(A, B) IN ((1, 2), (3, 4))</code> is
                 * equivalent to <code>((A, B) = (1, 2)) OR ((A, B) = (3, 4))</code>, which
                 * is equivalent to <code>(A = 1 AND B = 2) OR (A = 3 AND B = 4)</code>
                 */
                @Support
                Condition in(Collection<? extends Row«degree»<«TN(degree)»>> rows);
            
                /**
                 * Compare this row value expression with a set of row value expressions for
                 * equality
                 *
                 * @see #in(Collection)
                 */
                @Support
                Condition in(Row«degree»<«TN(degree)»>... rows);
            
                /**
                 * Compare this row value expression with a set of records for equality
                 *
                 * @see #in(Collection)
                 */
                @Support
                Condition in(Record«degree»<«TN(degree)»>... record);
            
                /**
                 * Compare this row value expression with a subselect for equality
                 *
                 * @see #in(Collection)
                 */
                @Support({ CUBRID, DB2, HSQLDB, MYSQL, ORACLE, POSTGRES })
                Condition in(Select<? extends Record«degree»<«TN(degree)»>> select);
            
                /**
                 * Compare this row value expression with a set of row value expressions for
                 * equality
                 * <p>
                 * Row NOT IN predicates can be simulated in those databases that do not
                 * support such predicates natively:
                 * <code>(A, B) NOT IN ((1, 2), (3, 4))</code> is equivalent to
                 * <code>NOT(((A, B) = (1, 2)) OR ((A, B) = (3, 4)))</code>, which is
                 * equivalent to <code>NOT((A = 1 AND B = 2) OR (A = 3 AND B = 4))</code>
                 */
                @Support
                Condition notIn(Collection<? extends Row«degree»<«TN(degree)»>> rows);
            
                /**
                 * Compare this row value expression with a set of row value expressions for
                 * equality
                 *
                 * @see #notIn(Collection)
                 */
                @Support
                Condition notIn(Row«degree»<«TN(degree)»>... rows);
            
                /**
                 * Compare this row value expression with a set of records for non-equality
                 *
                 * @see #notIn(Collection)
                 */
                @Support
                Condition notIn(Record«degree»<«TN(degree)»>... record);
            
                /**
                 * Compare this row value expression with a subselect for non-equality
                 *
                 * @see #notIn(Collection)
                 */
                @Support({ CUBRID, DB2, HSQLDB, MYSQL, ORACLE, POSTGRES })
                Condition notIn(Select<? extends Record«degree»<«TN(degree)»>> select);
            
                «IF degree == 2»
                // ------------------------------------------------------------------------
                // Row2-specific OVERLAPS predicate
                // ------------------------------------------------------------------------

                /**
                 * Check if this row value expression overlaps another row value expression
                 * <p>
                 * The SQL standard specifies a temporal <code>OVERLAPS</code> predicate,
                 * which comes in two flavours:
                 * <ul>
                 * <li><code>(DATE, DATE) OVERLAPS (DATE, DATE)</code></li>
                 * <li><code>(DATE, INTERVAL) OVERLAPS (DATE, INTERVAL)</code></li>
                 * </ul>
                 * <p>
                 * jOOQ also supports arbitrary 2-degree row value expression comparisons,
                 * by simulating them as such <code><pre>
                 * -- This predicate
                 * (A, B) OVERLAPS (C, D)
                 *
                 * -- can be simulated as such
                 * (C &lt;= B) AND (A &lt;= D)
                 * </pre></code>
                 */
                @Support
                Condition overlaps(T1 t1, T2 t2);

                /**
                 * Check if this row value expression overlaps another row value expression
                 * <p>
                 * The SQL standard specifies a temporal <code>OVERLAPS</code> predicate,
                 * which comes in two flavours:
                 * <ul>
                 * <li><code>(DATE, DATE) OVERLAPS (DATE, DATE)</code></li>
                 * <li><code>(DATE, INTERVAL) OVERLAPS (DATE, INTERVAL)</code></li>
                 * </ul>
                 * <p>
                 * jOOQ also supports arbitrary 2-degree row value expression comparisons,
                 * by simulating them as such <code><pre>
                 * -- This predicate
                 * (A, B) OVERLAPS (C, D)
                 *
                 * -- can be simulated as such
                 * (C &lt;= B) AND (A &lt;= D)
                 * </pre></code>
                 */
                @Support
                Condition overlaps(Field<T1> t1, Field<T2> t2);

                /**
                 * Check if this row value expression overlaps another row value expression
                 * <p>
                 * The SQL standard specifies a temporal <code>OVERLAPS</code> predicate,
                 * which comes in two flavours:
                 * <ul>
                 * <li><code>(DATE, DATE) OVERLAPS (DATE, DATE)</code></li>
                 * <li><code>(DATE, INTERVAL) OVERLAPS (DATE, INTERVAL)</code></li>
                 * </ul>
                 * <p>
                 * jOOQ also supports arbitrary 2-degree row value expression comparisons,
                 * by simulating them as such <code><pre>
                 * -- This predicate
                 * (A, B) OVERLAPS (C, D)
                 *
                 * -- can be simulated as such
                 * (C &lt;= B) AND (A &lt;= D)
                 * </pre></code>
                 */
                @Support
                Condition overlaps(Row2<T1, T2> row);

                «ENDIF»
            }
            ''');
             
            write("org.jooq.Row" + degree, out);
        }
    }
    
    def generateRowImpl() {
        val out = new StringBuilder();
        
        out.append('''
        «classHeader»
        package org.jooq.impl;
        
        import static java.util.Arrays.asList;
        import static org.jooq.Comparator.EQUALS;
        import static org.jooq.Comparator.NOT_EQUALS;
        import static org.jooq.SQLDialect.ASE;
        import static org.jooq.SQLDialect.DB2;
        import static org.jooq.SQLDialect.DERBY;
        import static org.jooq.SQLDialect.FIREBIRD;
        import static org.jooq.SQLDialect.INGRES;
        import static org.jooq.SQLDialect.ORACLE;
        import static org.jooq.SQLDialect.SQLITE;
        import static org.jooq.SQLDialect.SQLSERVER;
        import static org.jooq.SQLDialect.SYBASE;
        import static org.jooq.impl.Factory.row;
        import static org.jooq.impl.Factory.vals;
        import static org.jooq.impl.SubqueryOperator.NOT_IN;
        
        import java.util.ArrayList;
        import java.util.Arrays;
        import java.util.Collection;
        import java.util.List;
        
        import javax.annotation.Generated;

        import org.jooq.BindContext;
        import org.jooq.Comparator;
        import org.jooq.Condition;
        import org.jooq.Configuration;
        import org.jooq.Field;
        import org.jooq.Operator;
        import org.jooq.QueryPart;
        import org.jooq.QueryPartInternal;
        import org.jooq.Record;
        «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
        import org.jooq.Record«degree»;
        «ENDFOR»
        import org.jooq.RenderContext;
        import org.jooq.Row;
        «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
        import org.jooq.Row«degree»;
        «ENDFOR»
        import org.jooq.RowN;
        import org.jooq.Select;
        
        /**
         * @author Lukas Eder
         */
        «generatedAnnotation»
        @SuppressWarnings({ "rawtypes", "unchecked" })
        class RowImpl<«TN(Constants::MAX_ROW_DEGREE)»> extends AbstractQueryPart
        implements
        
            // This row implementation implements all row types. Type-safety is
            // being checked through the type-safe API. No need for further checks here
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
            Row«degree»<«TN(degree)»>,
            «ENDFOR»
            RowN {
        
            /**
             * Generated UID
             */
            private static final long serialVersionUID = -929427349071556318L;
        
            private final Field<?>[]  fields;
        
            RowImpl(Field<?>... fields) {
                super();
        
                this.fields = fields;
            }
        
            RowImpl(Collection<? extends Field<?>> fields) {
                this(fields.toArray(new Field[fields.size()]));
            }
        
            // ------------------------------------------------------------------------
            // XXX: QueryPart API
            // ------------------------------------------------------------------------
        
            @Override
            public final void toSQL(RenderContext context) {
                context.sql("(");
        
                String separator = "";
                for (Field<?> field : fields) {
                    context.sql(separator);
                    context.sql(field);
        
                    separator = ", ";
                }
        
                context.sql(")");
            }
        
            @Override
            public final void bind(BindContext context) {
                context.bind(fields);
            }
        
            // ------------------------------------------------------------------------
            // XXX: Row accessor API
            // ------------------------------------------------------------------------
        
            @Override
            public final int getDegree() {
                return fields.length;
            }
        
            @Override
            public final Field<?> getField(int index) {
                return fields[index];
            }
        
            @Override
            public final Field<?>[] getFields() {
                Field<?>[] result = new Field[fields.length];
                System.arraycopy(fields, 0, result, 0, fields.length);
                return result;
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Field<T«degree»> field«degree»() {
                return (Field<T«degree»>) fields[«degree - 1»];
            }
            «ENDFOR»

            // ------------------------------------------------------------------------
            // Equal / Not equal comparison predicates
            // ------------------------------------------------------------------------
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition equal(Row«degree»<«TN(degree)»> row) {
                return new Compare(row, Comparator.EQUALS);
            }
            «ENDFOR»
        
            @Override
            public final Condition equal(RowN row) {
                return new Compare(row, Comparator.EQUALS);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition equal(Record«degree»<«TN(degree)»> record) {
                return new Compare(record.valuesRow(), Comparator.EQUALS);
            }
            «ENDFOR»

            @Override
            public final Condition equal(Record record) {
                List<Field<?>> f = record.getFields();
                Row row = new RowImpl(vals(record.intoArray(), f.toArray(new Field[f.size()])));
                return new Compare(row, Comparator.EQUALS);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition equal(«TN_tn(degree)») {
                return equal(row(«tn(degree)»));
            }
            «ENDFOR»
        
            @Override
            public final Condition equal(Object... values) {
                return equal(row(values));
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition equal(«Field_TN_tn(degree)») {
                return equal(row(«tn(degree)»));
            }
            «ENDFOR»
        
            @Override
            public final Condition equal(Field<?>... f) {
                return equal(row(f));
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition eq(Row«degree»<«TN(degree)»> row) {
                return equal(row);
            }
            «ENDFOR»
        
            @Override
            public final Condition eq(RowN row) {
                return equal(row);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition eq(Record«degree»<«TN(degree)»> record) {
                return equal(record);
            }
            «ENDFOR»

            @Override
            public final Condition eq(Record record) {
                return equal(record);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition eq(«TN_tn(degree)») {
                return equal(«tn(degree)»);
            }
            «ENDFOR»
        
            @Override
            public final Condition eq(Object... values) {
                return equal(values);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition eq(«Field_TN_tn(degree)») {
                return equal(«tn(degree)»);
            }
            «ENDFOR»
        
            @Override
            public final Condition eq(Field<?>... values) {
                return equal(values);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition notEqual(Row«degree»<«TN(degree)»> row) {
                return new Compare(row, Comparator.NOT_EQUALS);
            }
            «ENDFOR»
        
            @Override
            public final Condition notEqual(RowN row) {
                return new Compare(row, Comparator.NOT_EQUALS);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition notEqual(Record«degree»<«TN(degree)»> record) {
                return new Compare(record.valuesRow(), Comparator.NOT_EQUALS);
            }
            «ENDFOR»

            @Override
            public final Condition notEqual(Record record) {
                List<Field<?>> f = record.getFields();
                Row row = new RowImpl(vals(record.intoArray(), f.toArray(new Field[f.size()])));
                return new Compare(row, Comparator.NOT_EQUALS);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition notEqual(«TN_tn(degree)») {
                return notEqual(row(«tn(degree)»));
            }
            «ENDFOR»
        
            @Override
            public final Condition notEqual(Object... values) {
                return notEqual(row(values));
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition notEqual(«Field_TN_tn(degree)») {
                return notEqual(row(«tn(degree)»));
            }
            «ENDFOR»
        
            @Override
            public final Condition notEqual(Field<?>... f) {
                return notEqual(row(f));
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition ne(Row«degree»<«TN(degree)»> row) {
                return notEqual(row);
            }
            «ENDFOR»

            @Override
            public final Condition ne(RowN row) {
                return notEqual(row);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition ne(Record«degree»<«TN(degree)»> record) {
                return notEqual(record);
            }
            «ENDFOR»

            @Override
            public final Condition ne(Record record) {
                return notEqual(record);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition ne(«TN_tn(degree)») {
                return notEqual(«tn(degree)»);
            }
            «ENDFOR»
        
            @Override
            public final Condition ne(Object... values) {
                return notEqual(values);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition ne(«Field_TN_tn(degree)») {
                return notEqual(«tn(degree)»);
            }
            «ENDFOR»
        
            @Override
            public final Condition ne(Field<?>... values) {
                return notEqual(values);
            }

            // ------------------------------------------------------------------------
            // Ordering comparison predicates
            // ------------------------------------------------------------------------
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lessThan(Row«degree»<«TN(degree)»> row) {
«««                return new Compare(row, Comparator.LESS);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition lessThan(RowN row) {
«««                return new Compare(row, Comparator.LESS);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lessThan(Record«degree»<«TN(degree)»> record) {
«««                return new Compare(record.valuesRow(), Comparator.LESS);
«««            }
«««            «ENDFOR»
«««
«««            @Override
«««            public final Condition lessThan(Record record) {
«««                List<Field<?>> f = record.getFields();
«««                Row row = new RowImpl(vals(record.intoArray(), f.toArray(new Field[f.size()])));
«««                return new Compare(row, Comparator.LESS);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lessThan(«TN_tn(degree)») {
«««                return lessThan(row(«tn(degree)»));
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition lessThan(Object... values) {
«««                return lessThan(row(values));
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lessThan(«Field_TN_tn(degree)») {
«««                return lessThan(row(«tn(degree)»));
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition lessThan(Field<?>... f) {
«««                return lessThan(row(f));
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lt(Row«degree»<«TN(degree)»> row) {
«««                return lessThan(row);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition lt(RowN row) {
«««                return lessThan(row);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lt(Record«degree»<«TN(degree)»> record) {
«««                return lessThan(record);
«««            }
«««            «ENDFOR»
«««
«««            @Override
«««            public final Condition lt(Record record) {
«««                return lessThan(record);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lt(«TN_tn(degree)») {
«««                return lessThan(«tn(degree)»);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition lt(Object... values) {
«««                return lessThan(values);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lt(«Field_TN_tn(degree)») {
«««                return lessThan(«tn(degree)»);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition lt(Field<?>... values) {
«««                return lessThan(values);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lessOrEqual(Row«degree»<«TN(degree)»> row) {
«««                return new Compare(row, Comparator.LESS_OR_EQUAL);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition lessOrEqual(RowN row) {
«««                return new Compare(row, Comparator.LESS_OR_EQUAL);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lessOrEqual(Record«degree»<«TN(degree)»> record) {
«««                return new Compare(record.valuesRow(), Comparator.LESS_OR_EQUAL);
«««            }
«««            «ENDFOR»
«««
«««            @Override
«««            public final Condition lessOrEqual(Record record) {
«««                List<Field<?>> f = record.getFields();
«««                Row row = new RowImpl(vals(record.intoArray(), f.toArray(new Field[f.size()])));
«««                return new Compare(row, Comparator.LESS_OR_EQUAL);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lessOrEqual(«TN_tn(degree)») {
«««                return lessOrEqual(row(«tn(degree)»));
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition lessOrEqual(Object... values) {
«««                return lessOrEqual(row(values));
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition lessOrEqual(«Field_TN_tn(degree)») {
«««                return lessOrEqual(row(«tn(degree)»));
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition lessOrEqual(Field<?>... f) {
«««                return lessOrEqual(row(f));
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition le(Row«degree»<«TN(degree)»> row) {
«««                return lessOrEqual(row);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition le(RowN row) {
«««                return lessOrEqual(row);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition le(Record«degree»<«TN(degree)»> record) {
«««                return lessOrEqual(record);
«««            }
«««            «ENDFOR»
«««
«««            @Override
«««            public final Condition le(Record record) {
«««                return lessOrEqual(record);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition le(«TN_tn(degree)») {
«««                return lessOrEqual(«tn(degree)»);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition le(Object... values) {
«««                return lessOrEqual(values);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition le(«Field_TN_tn(degree)») {
«««                return lessOrEqual(«tn(degree)»);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition le(Field<?>... values) {
«««                return lessOrEqual(values);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition greaterThan(Row«degree»<«TN(degree)»> row) {
«««                return new Compare(row, Comparator.GREATER);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition greaterThan(RowN row) {
«««                return new Compare(row, Comparator.GREATER);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition greaterThan(Record«degree»<«TN(degree)»> record) {
«««                return new Compare(record.valuesRow(), Comparator.GREATER);
«««            }
«««            «ENDFOR»
«««
«««            @Override
«««            public final Condition greaterThan(Record record) {
«««                List<Field<?>> f = record.getFields();
«««                Row row = new RowImpl(vals(record.intoArray(), f.toArray(new Field[f.size()])));
«««                return new Compare(row, Comparator.GREATER);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition greaterThan(«TN_tn(degree)») {
«««                return greaterThan(row(«tn(degree)»));
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition greaterThan(Object... values) {
«««                return greaterThan(row(values));
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition greaterThan(«Field_TN_tn(degree)») {
«««                return greaterThan(row(«tn(degree)»));
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition greaterThan(Field<?>... f) {
«««                return greaterThan(row(f));
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition gt(Row«degree»<«TN(degree)»> row) {
«««                return greaterThan(row);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition gt(RowN row) {
«««                return greaterThan(row);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition gt(Record«degree»<«TN(degree)»> record) {
«««                return greaterThan(record);
«««            }
«««            «ENDFOR»
«««
«««            @Override
«««            public final Condition gt(Record record) {
«««                return greaterThan(record);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition gt(«TN_tn(degree)») {
«««                return greaterThan(«tn(degree)»);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition gt(Object... values) {
«««                return greaterThan(values);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition gt(«Field_TN_tn(degree)») {
«««                return greaterThan(«tn(degree)»);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition gt(Field<?>... values) {
«««                return greaterThan(values);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition greaterOrEqual(Row«degree»<«TN(degree)»> row) {
«««                return new Compare(row, Comparator.GREATER_OR_EQUAL);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition greaterOrEqual(RowN row) {
«««                return new Compare(row, Comparator.GREATER_OR_EQUAL);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition greaterOrEqual(Record«degree»<«TN(degree)»> record) {
«««                return new Compare(record.valuesRow(), Comparator.GREATER_OR_EQUAL);
«««            }
«««            «ENDFOR»
«««
«««            @Override
«««            public final Condition greaterOrEqual(Record record) {
«««                List<Field<?>> f = record.getFields();
«««                Row row = new RowImpl(vals(record.intoArray(), f.toArray(new Field[f.size()])));
«««                return new Compare(row, Comparator.GREATER_OR_EQUAL);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition greaterOrEqual(«TN_tn(degree)») {
«««                return greaterOrEqual(row(«tn(degree)»));
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition greaterOrEqual(Object... values) {
«««                return greaterOrEqual(row(values));
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition greaterOrEqual(«Field_TN_tn(degree)») {
«««                return greaterOrEqual(row(«tn(degree)»));
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition greaterOrEqual(Field<?>... f) {
«««                return greaterOrEqual(row(f));
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition ge(Row«degree»<«TN(degree)»> row) {
«««                return greaterOrEqual(row);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition ge(RowN row) {
«««                return greaterOrEqual(row);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition ge(Record«degree»<«TN(degree)»> record) {
«««                return greaterOrEqual(record);
«««            }
«««            «ENDFOR»
«««
«««            @Override
«««            public final Condition ge(Record record) {
«««                return greaterOrEqual(record);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition ge(«TN_tn(degree)») {
«««                return greaterOrEqual(«tn(degree)»);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition ge(Object... values) {
«««                return greaterOrEqual(values);
«««            }
«««            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»
«««
«««            @Override
«««            public final Condition ge(«Field_TN_tn(degree)») {
«««                return greaterOrEqual(«tn(degree)»);
«««            }
«««            «ENDFOR»
«««        
«««            @Override
«««            public final Condition ge(Field<?>... values) {
«««                return greaterOrEqual(values);
«««            }

            // ------------------------------------------------------------------------
            // [NOT] DISTINCT predicates
            // ------------------------------------------------------------------------
        
            // ------------------------------------------------------------------------
            // [NOT] IN predicates
            // ------------------------------------------------------------------------
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition in(Row«degree»<«TN(degree)»>... rows) {
                return in(Arrays.asList(rows));
            }
            «ENDFOR»
        
            @Override
            public final Condition in(RowN... rows) {
                return in(Arrays.asList(rows));
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition in(Record«degree»<«TN(degree)»>... records) {
                Row«degree»<«TN(degree)»>[] rows = new Row«degree»[records.length];

                for (int i = 0; i < records.length; i++) {
                    rows[i] = records[i].valuesRow();
                }

                return in(rows);
            }
            «ENDFOR»

            @Override
            public final Condition in(Record... records) {
                RowN[] rows = new RowN[records.length];

                for (int i = 0; i < records.length; i++) {
                    List<Field<?>> f = records[i].getFields();
                    rows[i] = new RowImpl(vals(records[i].intoArray(), f.toArray(new Field[f.size()])));
                }

                return in(rows);
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition notIn(Row«degree»<«TN(degree)»>... rows) {
                return notIn(Arrays.asList(rows));
            }
            «ENDFOR»
        
            @Override
            public final Condition notIn(RowN... rows) {
                return notIn(Arrays.asList(rows));
            }
            «FOR degree : (1..Constants::MAX_ROW_DEGREE)»

            @Override
            public final Condition notIn(Record«degree»<«TN(degree)»>... records) {
                Row«degree»<«TN(degree)»>[] rows = new Row«degree»[records.length];

                for (int i = 0; i < records.length; i++) {
                    rows[i] = records[i].valuesRow();
                }

                return notIn(rows);
            }
            «ENDFOR»   

            @Override
            public final Condition notIn(Record... records) {
                RowN[] rows = new RowN[records.length];

                for (int i = 0; i < records.length; i++) {
                    List<Field<?>> f = records[i].getFields();
                    rows[i] = new RowImpl(vals(records[i].intoArray(), f.toArray(new Field[f.size()])));
                }

                return notIn(rows);
            }

            @Override
            public final Condition in(Collection rows) {
                QueryPartList<RowImpl<«TN(Constants::MAX_ROW_DEGREE)»>> list = new QueryPartList<RowImpl<«TN(Constants::MAX_ROW_DEGREE)»>>(rows);
                return new InRows(list, SubqueryOperator.IN);
            }
        
            @Override
            public final Condition notIn(Collection rows) {
                QueryPartList<RowImpl<«TN(Constants::MAX_ROW_DEGREE)»>> list = new QueryPartList<RowImpl<«TN(Constants::MAX_ROW_DEGREE)»>>(rows);
                return new InRows(list, SubqueryOperator.NOT_IN);
            }
        
            // ------------------------------------------------------------------------
            // Predicates involving subqueries
            // ------------------------------------------------------------------------
            
            @Override
            public final Condition equal(Select select) {
                return new Subquery(select, SubqueryOperator.EQUALS);
            }
        
            @Override
            public final Condition eq(Select select) {
                return equal(select);
            }
        
            @Override
            public final Condition notEqual(Select select) {
                return new Subquery(select, SubqueryOperator.NOT_EQUALS);
            }
        
            @Override
            public final Condition ne(Select select) {
                return notEqual(select);
            }
        
«««            @Override
«««            public final Condition greaterThan(Select select) {
«««                return new Subquery(select, SubqueryOperator.GREATER);
«««            }
«««        
«««            @Override
«««            public final Condition gt(Select select) {
«««                return greaterThan(select);
«««            }
«««        
«««            @Override
«««            public final Condition greaterOrEqual(Select select) {
«««                return new Subquery(select, SubqueryOperator.GREATER_OR_EQUAL);
«««            }
«««        
«««            @Override
«««            public final Condition ge(Select select) {
«««                return greaterOrEqual(select);
«««            }
«««        
«««            @Override
«««            public final Condition lessThan(Select select) {
«««                return new Subquery(select, SubqueryOperator.LESS);
«««            }
«««        
«««            @Override
«««            public final Condition lt(Select select) {
«««                return lessThan(select);
«««            }
«««        
«««            @Override
«««            public final Condition lessOrEqual(Select select) {
«««                return new Subquery(select, SubqueryOperator.LESS_OR_EQUAL);
«««            }
«««        
«««            @Override
«««            public final Condition le(Select select) {
«««                return lessOrEqual(select);
«««            }
«««        
            @Override
            public final Condition in(Select select) {
                return new Subquery(select, SubqueryOperator.IN);
            }
        
            @Override
            public final Condition notIn(Select select) {
                return new Subquery(select, SubqueryOperator.NOT_IN);
            }
        
            // ------------------------------------------------------------------------
            // XXX: Row2 API
            // ------------------------------------------------------------------------
        
            @Override
            public final Condition overlaps(T1 t1, T2 t2) {
                return overlaps(row(t1, t2));
            }
        
            @Override
            public final Condition overlaps(Field<T1> t1, Field<T2> t2) {
                return overlaps(row(t1, t2));
            }
        
            @Override
            public final Condition overlaps(Row2<T1, T2> row) {
                return new RowOverlaps(this, row);
            }
        
            // ------------------------------------------------------------------------
            // XXX: Implementation classes
            // ------------------------------------------------------------------------
        
            private class Compare extends AbstractCondition {
        
                /**
                 * Generated UID
                 */
                private static final long serialVersionUID = -1806139685201770706L;
        
                private final RowImpl<«TN(Constants::MAX_ROW_DEGREE)»> other;
                private final Comparator comparator;
        
                Compare(QueryPart other, Comparator comparator) {
                    this.other = (RowImpl<«TN(Constants::MAX_ROW_DEGREE)»>) other;
                    this.comparator = comparator;
                }
        
                @Override
                public final void toSQL(RenderContext context) {
                    delegate(context).toSQL(context);
                }
        
                @Override
                public final void bind(BindContext context) {
                    delegate(context).bind(context);
                }
        
                private final QueryPartInternal delegate(Configuration configuration) {
                    if (asList(ASE, DERBY, FIREBIRD, INGRES, SQLSERVER, SQLITE, SYBASE).contains(configuration.getDialect())) {
                        List<Condition> conditions = new ArrayList<Condition>();
        
                        for (int i = 0; i < fields.length; i++) {
                            conditions.add(fields[i].equal((Field) other.fields[i]));
                        }
        
                        Condition result = new CombinedCondition(Operator.AND, conditions);
        
                        if (comparator == NOT_EQUALS) {
                            result = result.not();
                        }
        
                        return (QueryPartInternal) result;
                    }
                    else {
                        return new Native();
                    }
                }
        
                private class Native extends AbstractCondition {
        
                    /**
                     * Generated UID
                     */
                    private static final long serialVersionUID = -2977241780111574353L;
        
                    @Override
                    public final void toSQL(RenderContext context) {
        
                        // Some dialects do not support != comparison with rows
                        if (comparator == NOT_EQUALS && asList(DB2).contains(context.getDialect())) {
                            context.keyword("not(")
                                   .sql(RowImpl.this)
                                   .sql(" = ")
                                   .sql(other)
                                   .sql(")");
                        }
                        else {
                            // Some databases need extra parentheses around the RHS
                            boolean extraParentheses = asList(ORACLE).contains(context.getDialect());
        
                            context.sql(RowImpl.this)
                                   .sql(" ")
                                   .sql(comparator.toSQL())
                                   .sql(" ")
                                   .sql(extraParentheses ? "(" : "")
                                   .sql(other)
                                   .sql(extraParentheses ? ")" : "");
                        }
                    }
        
                    @Override
                    public final void bind(BindContext context) {
                        context.bind(RowImpl.this).bind(other);
                    }
                }
            }
        
            private class InRows extends AbstractCondition {
        
                /**
                 * Generated UID
                 */
                private static final long serialVersionUID = -1806139685201770706L;
        
                private final QueryPartList<RowImpl<«TN(Constants::MAX_ROW_DEGREE)»>> other;
                private final SubqueryOperator operator;
        
                InRows(QueryPartList<RowImpl<«TN(Constants::MAX_ROW_DEGREE)»>> other, SubqueryOperator operator) {
                    this.other = other;
                    this.operator = operator;
                }
        
                @Override
                public final void toSQL(RenderContext context) {
                    delegate(context).toSQL(context);
                }
        
                @Override
                public final void bind(BindContext context) {
                    delegate(context).bind(context);
                }
        
                private final QueryPartInternal delegate(Configuration configuration) {
                    if (asList(ASE, DB2, DERBY, FIREBIRD, INGRES, SQLSERVER, SQLITE, SYBASE).contains(configuration.getDialect())) {
                        List<Condition> conditions = new ArrayList<Condition>();
        
                        for (RowImpl<«TN(Constants::MAX_ROW_DEGREE)»> row : other) {
                            conditions.add(new Compare(row, EQUALS));
                        }
        
                        Condition result = new CombinedCondition(Operator.OR, conditions);
        
                        if (operator == NOT_IN) {
                            result = result.not();
                        }
        
                        return (QueryPartInternal) result;
                    }
                    else {
                        return new Native();
                    }
                }
        
                private class Native extends AbstractCondition {
        
                    /**
                     * Generated UID
                     */
                    private static final long serialVersionUID = -7019193803316281371L;
        
                    @Override
                    public final void toSQL(RenderContext context) {
                        context.sql(RowImpl.this)
                               .sql(" ")
                               .keyword(operator.toSQL())
                               .sql(" (")
                               .sql(other)
                               .sql(")");
                    }
        
                    @Override
                    public final void bind(BindContext context) {
                        context.bind(RowImpl.this).bind((QueryPart) other);
                    }
                }
            }
        
            private class Subquery extends AbstractCondition {
        
                /**
                 * Generated UID
                 */
                private static final long      serialVersionUID = -1806139685201770706L;
        
                private final Select<?>        other;
                private final SubqueryOperator operator;
        
                Subquery(Select<?> other, SubqueryOperator operator) {
                    this.other = other;
                    this.operator = operator;
                }
        
                @Override
                public final void toSQL(RenderContext context) {
        
                    // Some databases need extra parentheses around the RHS
                    boolean extraParentheses = asList(ORACLE).contains(context.getDialect());
                    boolean subquery = context.subquery();
        
                    context.sql(RowImpl.this)
                           .sql(" ")
                           .keyword(operator.toSQL())
                           .sql(" (")
                           .sql(extraParentheses ? "(" : "")
                           .subquery(true)
                           .sql(other)
                           .subquery(subquery)
                           .sql(extraParentheses ? ")" : "")
                           .sql(")");
                }
        
                @Override
                public final void bind(BindContext context) {
                    context.bind(RowImpl.this).bind(other);
                }
            }
        }
        ''');
        
        write("org.jooq.impl.RowImpl", out);
    }
}