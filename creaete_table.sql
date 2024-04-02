CREATE TABLE "customers" (
  "customer_id" integer PRIMARY KEY,
  "CCCD_Passport" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "birthday" date,
  "gender" varchar,
  "email" varchar,
  "phone" varchar,
  "address" varchar
);

CREATE TABLE "rooms" (
  "room_id" integer PRIMARY KEY,
  "room_type" varchar,
  "facilities" varchar,
  "price" integer,
  "availability" varchar
);

CREATE TABLE "bookings" (
  "booking_id" integer PRIMARY KEY,
  "customer_id" integer,
  "room_id" integer UNIQUE,
  "number_of_adult" integer,
  "number_of_child" integer,
  "status" varchar,
  "check_in_date" date,
  "check_out_date" date,
  "total_price" integer,
  "reservation_status" varchar
);

CREATE TABLE "services" (
  "service_id" integer PRIMARY KEY,
  "service_name" varchar,
  "price" integer,
  "description" text
);

CREATE TABLE "payments" (
  "payment_id" integer PRIMARY KEY,
  "booking_id" integer UNIQUE,
  "method" varchar,
  "payment_status" varchar,
  "payment_date" date,
  "total_amount" integer,
  "note" text
);

CREATE TABLE "employees" (
  "employee_id" integer PRIMARY KEY,
  "CCCD" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "position" varchar,
  "department_id" varchar,
  "email" varchar,
  "phone" varchar,
  "address" varchar,
  "salary" integer,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "statistics" (
  "statistic_id" integer PRIMARY KEY,
  "date" date UNIQUE,
  "number_of_bookings" integer,
  "number_of_guests" integer,
  "revenue" integer,
  "occupancy_rate" integer,
  "top_services" varchar
);

CREATE TABLE "booking_service" (
  "booking_id" integer,
  "service_id" integer
);

CREATE TABLE "departments" (
  "department_id" integer PRIMARY KEY,
  "department_name" varchar,
  "description" text,
  "manager_id" integer
);

CREATE TABLE "department_service" (
  "department_id" integer,
  "service_id" integer
);

ALTER TABLE "bookings" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "rooms" ADD FOREIGN KEY ("room_id") REFERENCES "bookings" ("room_id");

ALTER TABLE "booking_service" ADD FOREIGN KEY ("service_id") REFERENCES "services" ("service_id");

ALTER TABLE "payments" ADD FOREIGN KEY ("booking_id") REFERENCES "bookings" ("booking_id");

ALTER TABLE "booking_service" ADD FOREIGN KEY ("booking_id") REFERENCES "bookings" ("booking_id");

ALTER TABLE "department_service" ADD FOREIGN KEY ("department_id") REFERENCES "departments" ("department_id");

ALTER TABLE "employees" ADD FOREIGN KEY ("department_id") REFERENCES "departments" ("department_id");

ALTER TABLE "department_service" ADD FOREIGN KEY ("service_id") REFERENCES "services" ("service_id");
