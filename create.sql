BEGIN;


CREATE TABLE IF NOT EXISTS public.equip_type
(
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.equip
(
    id integer NOT NULL,
    equip_type_id integer NOT NULL,
    country_id integer NOT NULL,
    model character varying(100),
    submodel character varying(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.countries
(
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.losses
(
    equip_id integer NOT NULL,
    losses_total integer,
    abandoned integer,
    abandoned_and_destroyed integer,
    captured integer,
    captured_and_destroyed integer,
    captured_and_stripped integer,
    PRIMARY KEY (equip_id)
);

ALTER TABLE IF EXISTS public.equip
    ADD FOREIGN KEY (equip_type_id)
    REFERENCES public.equip_type (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.equip
    ADD FOREIGN KEY (country_id)
    REFERENCES public.countries (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.losses
    ADD FOREIGN KEY (equip_id)
    REFERENCES public.equip (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;