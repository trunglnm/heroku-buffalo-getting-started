CREATE TABLE "user_accounts" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "auth_provider" VARCHAR (255) NOT NULL,
    "access_token" VARCHAR (255) NOT NULL,
    "first_name" VARCHAR (255) NOT NULL,
    "last_name" VARCHAR (255) NOT NULL,
    "age" integer NOT NULL,
    "sex" VARCHAR (255) NOT NULL,
    "city" VARCHAR (255) NOT NULL,
    "description" text NOT NULL,
    "is_guide" bool NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL
);

CREATE TABLE "guide_profiles" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "base_price"	decimal(13,2) NOT NULL,
    "rank"	varchar(50) NOT NULL DEFAULT 'BEGINNER',
    "total_trip"	int NOT NULL DEFAULT 0,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL
);

CREATE TABLE "guide_freetimes" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "start_dt" timestamp NOT NULL DEFAULT current_timestamp,
    "end_dt" timestamp NOT NULL DEFAULT current_timestamp,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL
);

CREATE TABLE "user_languages" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "language_id" UUID NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL
);

CREATE TABLE "user_activities" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "activity_id" UUID NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL
);

CREATE TABLE "bookings" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "traveller_id" UUID NOT NULL,
    "guide_id" UUID NOT NULL,
    "status" VARCHAR (255) NOT NULL,
    "total_price" decimal(13,2) NOT NULL,
    "extend_price" decimal(13,2) NOT NULL,
    "meet_dt" timestamp NOT NULL,
    "booking_type" time NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL
);

CREATE TABLE "trips" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "booking_id" UUID NOT NULL,
    "cancel_by" VARCHAR (255) NOT NULL,
    "extend_time" time NOT NULL,
    "start_dt" timestamp NOT NULL,
    "end_dt" timestamp NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL
);

CREATE TABLE "user_reviews" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "reviewer" UUID NOT NULL,
    "reviewee" UUID NOT NULL,
    "content" text NOT NULL,
    "rating" VARCHAR (255) NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL
);

CREATE TABLE "user_payments" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "trip_id" UUID NOT NULL,
    "price" decimal(13,2) NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL
);

CREATE TABLE "mst_languages" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "language" varchar(255) NOT NULL
);

CREATE TABLE "mst_activities" (
    "id" UUID NOT NULL,
    PRIMARY KEY("id"),
    "activity_type" varchar(255) NOT NULL
);
