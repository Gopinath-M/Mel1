PGDMP     	    &                p            melaka_development    8.4.11    8.4.11 	    ]           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ^           0    0 
   STDSTRINGS 
   STDSTRINGS     )   SET standard_conforming_strings = 'off';
                       false                       1259    27800    system_model_types    TABLE     �   CREATE TABLE system_model_types (
    id integer NOT NULL,
    name character varying(255),
    system_access_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 &   DROP TABLE public.system_model_types;
       public         postgres    false    3                       1259    27798    system_model_types_id_seq    SEQUENCE     {   CREATE SEQUENCE system_model_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 0   DROP SEQUENCE public.system_model_types_id_seq;
       public       postgres    false    3    258            _           0    0    system_model_types_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE system_model_types_id_seq OWNED BY system_model_types.id;
            public       postgres    false    257            `           0    0    system_model_types_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('system_model_types_id_seq', 117, true);
            public       postgres    false    257            Y           2604    27803    id    DEFAULT     p   ALTER TABLE ONLY system_model_types ALTER COLUMN id SET DEFAULT nextval('system_model_types_id_seq'::regclass);
 D   ALTER TABLE public.system_model_types ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    258    257    258            \          0    27800    system_model_types 
   TABLE DATA               Y   COPY system_model_types (id, name, system_access_id, created_at, updated_at) FROM stdin;
    public       postgres    false    258   �	       [           2606    27805    system_model_types_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY system_model_types
    ADD CONSTRAINT system_model_types_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.system_model_types DROP CONSTRAINT system_model_types_pkey;
       public         postgres    false    258    258            \   �  x���]sۺ�����W�t:N��N�uE�����Ln`�qhI�KJu���u�Xw&���M,��	FnFߚ������<�/Gq�[��&���q�3%����Ku�mu��:��0,��RIF�����z�@D#Q6�W-lj�����,����I�0���4���ї��j�ą��
�Z���etQ5۶�h*N޲��[����wt�UƬ��"�SF"uL��K˲�<��Hăk]7g+�]��dXy� �J$�i!���N"a�t�i-*U��D"=��E��$U�D�o���Y!���$�/�3GY� �.�N"Qń(R&"2�J"�Dyo?o��,�
	�׺��O����C�J�XF"����%�6+���Xp8�Kp��H�S�d��U�C�I$�S\��?�g5
��송�q��S�I�Bpʓ�q��$�V"�����S�T�Y�dq�K�1/��<�Y'�,Oph��y�HT�Y����ǚ�����$JN�"͹Hɑ�ҟeN��4-ҌǕ*�a�D�iZdl���s��(9M��!T�@�9����0C�����Er�(��&FYf�%�Cv����I�G�Z��?�(�gEfHF��؃���o��T�?ÜDP-C�e�z��4058�u�ofmmb�W�����(�����k�Zg��'Q*����aC.*	vaH�<�[4��M��d��:��S���40�8��,Y��>n��Ic���ߢᲫ:��9��B'QZ����*�W�nuM��C �X�0|9��a���`������g7'Q�ᳺy�kPgU�Wz���1 f�Dh���0�� ��^�K�����w�ax��y�D�썯��]����j�#����q���V7�t[w�L7ƕ�ш���\N�,�=^�p�'��w���p�����|�LS�\�֬�ОJ�safas �oS�'�8�j�DX_|9<6E�G���I����W�Gg����9�.a%ʔ��k����6Sd�3V�<�l�u�0�ꩿt;�05�Zt��J�8��;�p�3�ʰ��I ��Dy½���t:az�B�~[�DX���;S��!S��F��N�<;���?2ПCV�<�恹>QH����D��5G�Q&x�P�&����O��f��X'Q�O�����3`33̶1g7�"��O>7(��狎�5�`�ڞ~�\�*���$*[�3D�����D�d�o|s5\0|���Y�
6����lĽx����y�D�Bظ��n�_�a����N.O�Շ��dO���ë�i�a�����楋�0H�0+����'�?�;�կ��<����y�a����j�:�s9(�D�:+�1���;�|�F������{���V-;��6/U;�`Y	3yo��%0�#����!���;��p�UŦ�jS�'|����^e���-|��p�ܶ530��Z���N"!���^�3��,�b0^?�U�I����>{	�����y�]H(��B/Q���΅���J ����Oe`ϳ�y?�V�����c�U(+����W���v��,A
���30�[	�غZE�Q���Y�<��˶�R�cFӟ_��<Va��@����Jo�v���u�*���/'�8@��w?�f��W�DE>8LM�(D����n�����٠#�Tx��^������Z�br�A�L�WQ�D��fk�;Ü�&[��g����{�����[�L�Ah�V"ԍ�GWUW5Σ�,�p�Q3W�O����+��N?��m�����^"��=��z�m4\�����f���$�n��~�n����OlT��x�JTf=�Z��I��v�>��"�ITR`�4Q5�+�P��x7N�98Ʈ��V"T�>��X<��@�Hc���^�R���۵{*g�0��8������%�RF +�:xv|iMm-x|9��e�$R��:,/���W\H�J�UH�`R��[E�.X��{�`�;�r�E��'��G�v��=��q��|��b����%w���
���s�������?.8�����N"{��3x��B�oݽD�8\ʵ�͏�]Hwm�3�U �P���z�t)~�Y�y�?0�B�3V���0��+�����5\��Y -`�� ΂`Ɂ���u��y�0`S�S��(M~�6���-Ã!^R�I�f���7�Y�?8��C=����-��@����?���,�J���4ժ�6����K�+.5��y?����uϪgL�Ύ�I8���-c/!�W�px���6�`�n�*�x�75���{��K��=��a��     