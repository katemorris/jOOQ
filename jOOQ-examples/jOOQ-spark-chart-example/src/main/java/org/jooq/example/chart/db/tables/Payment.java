/*
 * This file is generated by jOOQ.
 */
package org.jooq.example.chart.db.tables;


import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import org.jooq.Field;
import org.jooq.ForeignKey;
import org.jooq.Identity;
import org.jooq.Index;
import org.jooq.Name;
import org.jooq.Record;
import org.jooq.Row6;
import org.jooq.Schema;
import org.jooq.Table;
import org.jooq.TableField;
import org.jooq.UniqueKey;
import org.jooq.example.chart.db.Indexes;
import org.jooq.example.chart.db.Keys;
import org.jooq.example.chart.db.Public;
import org.jooq.example.chart.db.tables.records.PaymentRecord;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;


/**
 * This class is generated by jOOQ.
 */
@SuppressWarnings({ "all", "unchecked", "rawtypes" })
public class Payment extends TableImpl<PaymentRecord> {

    private static final long serialVersionUID = -1035193480;

    /**
     * The reference instance of <code>public.payment</code>
     */
    public static final Payment PAYMENT = new Payment();

    /**
     * The class holding records for this type
     */
    @Override
    public Class<PaymentRecord> getRecordType() {
        return PaymentRecord.class;
    }

    /**
     * The column <code>public.payment.payment_id</code>.
     */
    public final TableField<PaymentRecord, Integer> PAYMENT_ID = createField(DSL.name("payment_id"), org.jooq.impl.SQLDataType.INTEGER.nullable(false).defaultValue(org.jooq.impl.DSL.field("nextval('payment_payment_id_seq'::regclass)", org.jooq.impl.SQLDataType.INTEGER)), this, "");

    /**
     * The column <code>public.payment.customer_id</code>.
     */
    public final TableField<PaymentRecord, Integer> CUSTOMER_ID = createField(DSL.name("customer_id"), org.jooq.impl.SQLDataType.INTEGER.nullable(false), this, "");

    /**
     * The column <code>public.payment.staff_id</code>.
     */
    public final TableField<PaymentRecord, Integer> STAFF_ID = createField(DSL.name("staff_id"), org.jooq.impl.SQLDataType.INTEGER.nullable(false), this, "");

    /**
     * The column <code>public.payment.rental_id</code>.
     */
    public final TableField<PaymentRecord, Integer> RENTAL_ID = createField(DSL.name("rental_id"), org.jooq.impl.SQLDataType.INTEGER.nullable(false), this, "");

    /**
     * The column <code>public.payment.amount</code>.
     */
    public final TableField<PaymentRecord, BigDecimal> AMOUNT = createField(DSL.name("amount"), org.jooq.impl.SQLDataType.NUMERIC(5, 2).nullable(false), this, "");

    /**
     * The column <code>public.payment.payment_date</code>.
     */
    public final TableField<PaymentRecord, LocalDateTime> PAYMENT_DATE = createField(DSL.name("payment_date"), org.jooq.impl.SQLDataType.LOCALDATETIME.nullable(false), this, "");

    /**
     * Create a <code>public.payment</code> table reference
     */
    public Payment() {
        this(DSL.name("payment"), null);
    }

    /**
     * Create an aliased <code>public.payment</code> table reference
     */
    public Payment(String alias) {
        this(DSL.name(alias), PAYMENT);
    }

    /**
     * Create an aliased <code>public.payment</code> table reference
     */
    public Payment(Name alias) {
        this(alias, PAYMENT);
    }

    private Payment(Name alias, Table<PaymentRecord> aliased) {
        this(alias, aliased, null);
    }

    private Payment(Name alias, Table<PaymentRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment(""));
    }

    public <O extends Record> Payment(Table<O> child, ForeignKey<O, PaymentRecord> key) {
        super(child, key, PAYMENT);
    }

    @Override
    public Schema getSchema() {
        return Public.PUBLIC;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(Indexes.IDX_FK_CUSTOMER_ID, Indexes.IDX_FK_STAFF_ID);
    }

    @Override
    public Identity<PaymentRecord, Integer> getIdentity() {
        return Keys.IDENTITY_PAYMENT;
    }

    @Override
    public UniqueKey<PaymentRecord> getPrimaryKey() {
        return Keys.PAYMENT_PKEY;
    }

    @Override
    public List<UniqueKey<PaymentRecord>> getKeys() {
        return Arrays.<UniqueKey<PaymentRecord>>asList(Keys.PAYMENT_PKEY);
    }

    @Override
    public List<ForeignKey<PaymentRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<PaymentRecord, ?>>asList(Keys.PAYMENT__PAYMENT_CUSTOMER_ID_FKEY, Keys.PAYMENT__PAYMENT_STAFF_ID_FKEY, Keys.PAYMENT__PAYMENT_RENTAL_ID_FKEY);
    }

    public Customer customer() {
        return new Customer(this, Keys.PAYMENT__PAYMENT_CUSTOMER_ID_FKEY);
    }

    public Staff staff() {
        return new Staff(this, Keys.PAYMENT__PAYMENT_STAFF_ID_FKEY);
    }

    public Rental rental() {
        return new Rental(this, Keys.PAYMENT__PAYMENT_RENTAL_ID_FKEY);
    }

    @Override
    public Payment as(String alias) {
        return new Payment(DSL.name(alias), this);
    }

    @Override
    public Payment as(Name alias) {
        return new Payment(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public Payment rename(String name) {
        return new Payment(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public Payment rename(Name name) {
        return new Payment(name, null);
    }

    // -------------------------------------------------------------------------
    // Row6 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row6<Integer, Integer, Integer, Integer, BigDecimal, LocalDateTime> fieldsRow() {
        return (Row6) super.fieldsRow();
    }
}
