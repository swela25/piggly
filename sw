-- Table: salesforce.h_messages

-- DROP TABLE salesforce.h_messages;

CREATE TABLE salesforce.h_messages
(
    message_id__c character varying(18) COLLATE pg_catalog."default" NOT NULL,
    message_subject__c character varying(30) COLLATE pg_catalog."default",
    message_short_text__c character varying(128) COLLATE pg_catalog."default",
    message__c character varying(1500) COLLATE pg_catalog."default",
    status__c character varying(128) COLLATE pg_catalog."default",
    systemmodstamp timestamp without time zone,
    CONSTRAINT h_messages_pkey PRIMARY KEY (message_id__c)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE salesforce.h_messages
    OWNER to u92hvc285l07qk;
	
	
	
	
	
	
	
	
	
	
	-- Table: salesforce.h_member_message

-- DROP TABLE salesforce.h_member_message;

CREATE TABLE salesforce.h_member_message
(
    message_id__c character varying(18) COLLATE pg_catalog."default",
    member_id__c integer,
    for_all_members__c boolean DEFAULT true,
    systemmodstamp timestamp without time zone,
    new_message__c boolean,
    CONSTRAINT h_member_message_member_id__c_fkey FOREIGN KEY (member_id__c)
        REFERENCES salesforce.account (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT h_member_message_message_id__c_fkey FOREIGN KEY (message_id__c)
        REFERENCES salesforce.h_messages (message_id__c) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE salesforce.h_member_message
    OWNER to u92hvc285l07qk;
