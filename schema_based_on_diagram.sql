CREATE DATABASE patient_treatment

CREATE TABLE patients (
    id SERIAL PRIMARY KEY NOT NULL,
    name varchar(50),
    date_of_birth date
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY NOT NULL,
    admitted_at timestamp,
    patient_id INT,
    status varchar(35),
    CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY NOT NULL,
    type varchar(50),
    name varchar(50)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY NOT NULL,
    total_amount DECIMAL,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
    CONSTRAINT fk_medical_history_id FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY NOT NULL,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_treatment_id FOREIGN KEY (treatment_id) REFERENCES medical_histories(id),
    CONSTRAINT fk_invoice_id FOREIGN KEY (invoice_id) REFERENCES medical_histories(id)
);

CREATE TABLE treatment_history (
    treatments_id INT,
    medical_historys_id INT,
    CONSTRAINT fk_treatments_id FOREIGN KEY (treatments_id) REFERENCES treatments(id),
    CONSTRAINT fk_medical_historys_id FOREIGN KEY (medical_historys_id) REFERENCES medical_histories(id)
);

-- CREATE INDEXES

CREATE INDEX on medical_histories(patient_id);
CREATE INDEX on invoices(medical_history_id);
CREATE INDEX on invoice_items(treatment_id);
CREATE INDEX on invoice_items(invoice_id);
CREATE INDEX on treatment_history(treatments_id);
CREATE INDEX on treatment_history(medical_historys_id);

