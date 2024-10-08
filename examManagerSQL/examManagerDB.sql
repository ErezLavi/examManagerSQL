PGDMP  :    )                |           examManagerDB    16.3    16.3 E    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            G           1262    16881    examManagerDB    DATABASE     �   CREATE DATABASE "examManagerDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Hebrew_Israel.1252';
    DROP DATABASE "examManagerDB";
                postgres    false            �            1259    16882    answer    TABLE     i   CREATE TABLE public.answer (
    answer_id integer NOT NULL,
    text character varying(500) NOT NULL
);
    DROP TABLE public.answer;
       public         heap    postgres    false            �            1259    16885    answer_answer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.answer_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.answer_answer_id_seq;
       public          postgres    false    215            H           0    0    answer_answer_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.answer_answer_id_seq OWNED BY public.answer.answer_id;
          public          postgres    false    216            �            1259    16886    exam    TABLE     ~   CREATE TABLE public.exam (
    exam_id integer NOT NULL,
    subject_id integer NOT NULL,
    lecturer_id integer NOT NULL
);
    DROP TABLE public.exam;
       public         heap    postgres    false            �            1259    16889    exam_exam_id_seq    SEQUENCE     �   CREATE SEQUENCE public.exam_exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.exam_exam_id_seq;
       public          postgres    false    217            I           0    0    exam_exam_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.exam_exam_id_seq OWNED BY public.exam.exam_id;
          public          postgres    false    218            �            1259    16890    exam_question    TABLE     f   CREATE TABLE public.exam_question (
    exam_id integer NOT NULL,
    question_id integer NOT NULL
);
 !   DROP TABLE public.exam_question;
       public         heap    postgres    false            �            1259    16893    lecturer    TABLE     �   CREATE TABLE public.lecturer (
    lecturer_id integer NOT NULL,
    username character varying(15) NOT NULL,
    password character varying NOT NULL,
    CONSTRAINT lecturer_username_check CHECK ((length((username)::text) > 1))
);
    DROP TABLE public.lecturer;
       public         heap    postgres    false            �            1259    16897    lecturer_lecturer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lecturer_lecturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.lecturer_lecturer_id_seq;
       public          postgres    false    220            J           0    0    lecturer_lecturer_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.lecturer_lecturer_id_seq OWNED BY public.lecturer.lecturer_id;
          public          postgres    false    221            �            1259    16898    multiple_choice_question    TABLE     S   CREATE TABLE public.multiple_choice_question (
    question_id integer NOT NULL
);
 ,   DROP TABLE public.multiple_choice_question;
       public         heap    postgres    false            �            1259    16901    multiple_choice_question_answer    TABLE     �   CREATE TABLE public.multiple_choice_question_answer (
    question_id integer NOT NULL,
    answer_id integer NOT NULL,
    is_correct_answer boolean NOT NULL
);
 3   DROP TABLE public.multiple_choice_question_answer;
       public         heap    postgres    false            �            1259    16904    open_question    TABLE     h   CREATE TABLE public.open_question (
    question_id integer NOT NULL,
    answer_id integer NOT NULL
);
 !   DROP TABLE public.open_question;
       public         heap    postgres    false            �            1259    16907    question    TABLE     �  CREATE TABLE public.question (
    question_id integer NOT NULL,
    title character varying(255) NOT NULL,
    difficulty character varying(7) NOT NULL,
    lecturer_id integer NOT NULL,
    subject_id integer NOT NULL,
    CONSTRAINT question_difficulty_check CHECK (((difficulty)::text = ANY (ARRAY[('easy'::character varying)::text, ('medium'::character varying)::text, ('hard'::character varying)::text])))
);
    DROP TABLE public.question;
       public         heap    postgres    false            �            1259    16911    question_question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.question_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.question_question_id_seq;
       public          postgres    false    225            K           0    0    question_question_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.question_question_id_seq OWNED BY public.question.question_id;
          public          postgres    false    226            �            1259    16912    subject    TABLE     s   CREATE TABLE public.subject (
    subject_id integer NOT NULL,
    subject_name character varying(255) NOT NULL
);
    DROP TABLE public.subject;
       public         heap    postgres    false            �            1259    16915    subject_lecturer    TABLE     l   CREATE TABLE public.subject_lecturer (
    subject_id integer NOT NULL,
    lecturer_id integer NOT NULL
);
 $   DROP TABLE public.subject_lecturer;
       public         heap    postgres    false            �            1259    16918    subject_subject_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subject_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.subject_subject_id_seq;
       public          postgres    false    227            L           0    0    subject_subject_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.subject_subject_id_seq OWNED BY public.subject.subject_id;
          public          postgres    false    229            x           2604    16919    answer answer_id    DEFAULT     t   ALTER TABLE ONLY public.answer ALTER COLUMN answer_id SET DEFAULT nextval('public.answer_answer_id_seq'::regclass);
 ?   ALTER TABLE public.answer ALTER COLUMN answer_id DROP DEFAULT;
       public          postgres    false    216    215            y           2604    16920    exam exam_id    DEFAULT     l   ALTER TABLE ONLY public.exam ALTER COLUMN exam_id SET DEFAULT nextval('public.exam_exam_id_seq'::regclass);
 ;   ALTER TABLE public.exam ALTER COLUMN exam_id DROP DEFAULT;
       public          postgres    false    218    217            z           2604    16921    lecturer lecturer_id    DEFAULT     |   ALTER TABLE ONLY public.lecturer ALTER COLUMN lecturer_id SET DEFAULT nextval('public.lecturer_lecturer_id_seq'::regclass);
 C   ALTER TABLE public.lecturer ALTER COLUMN lecturer_id DROP DEFAULT;
       public          postgres    false    221    220            {           2604    16922    question question_id    DEFAULT     |   ALTER TABLE ONLY public.question ALTER COLUMN question_id SET DEFAULT nextval('public.question_question_id_seq'::regclass);
 C   ALTER TABLE public.question ALTER COLUMN question_id DROP DEFAULT;
       public          postgres    false    226    225            |           2604    16923    subject subject_id    DEFAULT     x   ALTER TABLE ONLY public.subject ALTER COLUMN subject_id SET DEFAULT nextval('public.subject_subject_id_seq'::regclass);
 A   ALTER TABLE public.subject ALTER COLUMN subject_id DROP DEFAULT;
       public          postgres    false    229    227            3          0    16882    answer 
   TABLE DATA           1   COPY public.answer (answer_id, text) FROM stdin;
    public          postgres    false    215   �U       5          0    16886    exam 
   TABLE DATA           @   COPY public.exam (exam_id, subject_id, lecturer_id) FROM stdin;
    public          postgres    false    217   yV       7          0    16890    exam_question 
   TABLE DATA           =   COPY public.exam_question (exam_id, question_id) FROM stdin;
    public          postgres    false    219   �V       8          0    16893    lecturer 
   TABLE DATA           C   COPY public.lecturer (lecturer_id, username, password) FROM stdin;
    public          postgres    false    220   +W       :          0    16898    multiple_choice_question 
   TABLE DATA           ?   COPY public.multiple_choice_question (question_id) FROM stdin;
    public          postgres    false    222    Z       ;          0    16901    multiple_choice_question_answer 
   TABLE DATA           d   COPY public.multiple_choice_question_answer (question_id, answer_id, is_correct_answer) FROM stdin;
    public          postgres    false    223   )Z       <          0    16904    open_question 
   TABLE DATA           ?   COPY public.open_question (question_id, answer_id) FROM stdin;
    public          postgres    false    224   tZ       =          0    16907    question 
   TABLE DATA           [   COPY public.question (question_id, title, difficulty, lecturer_id, subject_id) FROM stdin;
    public          postgres    false    225   �Z       ?          0    16912    subject 
   TABLE DATA           ;   COPY public.subject (subject_id, subject_name) FROM stdin;
    public          postgres    false    227   �[       @          0    16915    subject_lecturer 
   TABLE DATA           C   COPY public.subject_lecturer (subject_id, lecturer_id) FROM stdin;
    public          postgres    false    228   �[       M           0    0    answer_answer_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.answer_answer_id_seq', 20, true);
          public          postgres    false    216            N           0    0    exam_exam_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.exam_exam_id_seq', 25, true);
          public          postgres    false    218            O           0    0    lecturer_lecturer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.lecturer_lecturer_id_seq', 14, true);
          public          postgres    false    221            P           0    0    question_question_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.question_question_id_seq', 22, true);
          public          postgres    false    226            Q           0    0    subject_subject_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.subject_subject_id_seq', 4, true);
          public          postgres    false    229            �           2606    16925    answer answer_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (answer_id);
 <   ALTER TABLE ONLY public.answer DROP CONSTRAINT answer_pkey;
       public            postgres    false    215            �           2606    16927    exam exam_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (exam_id);
 8   ALTER TABLE ONLY public.exam DROP CONSTRAINT exam_pkey;
       public            postgres    false    217            �           2606    16929     exam_question exam_question_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.exam_question
    ADD CONSTRAINT exam_question_pkey PRIMARY KEY (exam_id, question_id);
 J   ALTER TABLE ONLY public.exam_question DROP CONSTRAINT exam_question_pkey;
       public            postgres    false    219    219            �           2606    16931    lecturer lecturer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT lecturer_pkey PRIMARY KEY (lecturer_id);
 @   ALTER TABLE ONLY public.lecturer DROP CONSTRAINT lecturer_pkey;
       public            postgres    false    220            �           2606    16933    lecturer lecturer_username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT lecturer_username_key UNIQUE (username);
 H   ALTER TABLE ONLY public.lecturer DROP CONSTRAINT lecturer_username_key;
       public            postgres    false    220            �           2606    16935 D   multiple_choice_question_answer multiple_choice_question_answer_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.multiple_choice_question_answer
    ADD CONSTRAINT multiple_choice_question_answer_pkey PRIMARY KEY (question_id, answer_id);
 n   ALTER TABLE ONLY public.multiple_choice_question_answer DROP CONSTRAINT multiple_choice_question_answer_pkey;
       public            postgres    false    223    223            �           2606    16937 6   multiple_choice_question multiple_choice_question_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.multiple_choice_question
    ADD CONSTRAINT multiple_choice_question_pkey PRIMARY KEY (question_id);
 `   ALTER TABLE ONLY public.multiple_choice_question DROP CONSTRAINT multiple_choice_question_pkey;
       public            postgres    false    222            �           2606    16939     open_question open_question_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.open_question
    ADD CONSTRAINT open_question_pkey PRIMARY KEY (question_id, answer_id);
 J   ALTER TABLE ONLY public.open_question DROP CONSTRAINT open_question_pkey;
       public            postgres    false    224    224            �           2606    16941    question question_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (question_id);
 @   ALTER TABLE ONLY public.question DROP CONSTRAINT question_pkey;
       public            postgres    false    225            �           2606    16943 &   subject_lecturer subject_lecturer_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.subject_lecturer
    ADD CONSTRAINT subject_lecturer_pkey PRIMARY KEY (subject_id, lecturer_id);
 P   ALTER TABLE ONLY public.subject_lecturer DROP CONSTRAINT subject_lecturer_pkey;
       public            postgres    false    228    228            �           2606    16945    subject subject_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (subject_id);
 >   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_pkey;
       public            postgres    false    227            �           2606    16947     subject subject_subject_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_subject_name_key UNIQUE (subject_name);
 J   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_subject_name_key;
       public            postgres    false    227            �           2606    16948    exam exam_lecturer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES public.lecturer(lecturer_id);
 D   ALTER TABLE ONLY public.exam DROP CONSTRAINT exam_lecturer_id_fkey;
       public          postgres    false    217    220    4742            �           2606    16953 (   exam_question exam_question_exam_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.exam_question
    ADD CONSTRAINT exam_question_exam_id_fkey FOREIGN KEY (exam_id) REFERENCES public.exam(exam_id);
 R   ALTER TABLE ONLY public.exam_question DROP CONSTRAINT exam_question_exam_id_fkey;
       public          postgres    false    217    219    4738            �           2606    16958 ,   exam_question exam_question_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.exam_question
    ADD CONSTRAINT exam_question_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 V   ALTER TABLE ONLY public.exam_question DROP CONSTRAINT exam_question_question_id_fkey;
       public          postgres    false    4752    219    225            �           2606    16963    exam exam_subject_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(subject_id);
 C   ALTER TABLE ONLY public.exam DROP CONSTRAINT exam_subject_id_fkey;
       public          postgres    false    217    227    4754            �           2606    16968 N   multiple_choice_question_answer multiple_choice_question_answer_answer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.multiple_choice_question_answer
    ADD CONSTRAINT multiple_choice_question_answer_answer_id_fkey FOREIGN KEY (answer_id) REFERENCES public.answer(answer_id);
 x   ALTER TABLE ONLY public.multiple_choice_question_answer DROP CONSTRAINT multiple_choice_question_answer_answer_id_fkey;
       public          postgres    false    215    223    4736            �           2606    16973 P   multiple_choice_question_answer multiple_choice_question_answer_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.multiple_choice_question_answer
    ADD CONSTRAINT multiple_choice_question_answer_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.multiple_choice_question(question_id);
 z   ALTER TABLE ONLY public.multiple_choice_question_answer DROP CONSTRAINT multiple_choice_question_answer_question_id_fkey;
       public          postgres    false    222    4746    223            �           2606    16978 B   multiple_choice_question multiple_choice_question_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.multiple_choice_question
    ADD CONSTRAINT multiple_choice_question_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 l   ALTER TABLE ONLY public.multiple_choice_question DROP CONSTRAINT multiple_choice_question_question_id_fkey;
       public          postgres    false    225    222    4752            �           2606    16983 *   open_question open_question_answer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.open_question
    ADD CONSTRAINT open_question_answer_id_fkey FOREIGN KEY (answer_id) REFERENCES public.answer(answer_id);
 T   ALTER TABLE ONLY public.open_question DROP CONSTRAINT open_question_answer_id_fkey;
       public          postgres    false    224    215    4736            �           2606    16988 ,   open_question open_question_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.open_question
    ADD CONSTRAINT open_question_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 V   ALTER TABLE ONLY public.open_question DROP CONSTRAINT open_question_question_id_fkey;
       public          postgres    false    224    4752    225            �           2606    16993 "   question question_lecturer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES public.lecturer(lecturer_id);
 L   ALTER TABLE ONLY public.question DROP CONSTRAINT question_lecturer_id_fkey;
       public          postgres    false    225    4742    220            �           2606    16998 !   question question_subject_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(subject_id);
 K   ALTER TABLE ONLY public.question DROP CONSTRAINT question_subject_id_fkey;
       public          postgres    false    227    225    4754            �           2606    17003 2   subject_lecturer subject_lecturer_lecturer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subject_lecturer
    ADD CONSTRAINT subject_lecturer_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES public.lecturer(lecturer_id);
 \   ALTER TABLE ONLY public.subject_lecturer DROP CONSTRAINT subject_lecturer_lecturer_id_fkey;
       public          postgres    false    220    228    4742            �           2606    17008 1   subject_lecturer subject_lecturer_subject_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subject_lecturer
    ADD CONSTRAINT subject_lecturer_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(subject_id);
 [   ALTER TABLE ONLY public.subject_lecturer DROP CONSTRAINT subject_lecturer_subject_id_fkey;
       public          postgres    false    4754    228    227            3   �   x�=N1n�0��Wp��n�c����I�-����/���x��ݑ�-�򥕶�T�b��	GZJ٨ŔÈg�Ӫ����x��N>+�d���6��%A�օ$���Z�p�< ���G%�`*�����Y��Ь+�L<�'d����"�����
n�\�j�=��o<yv�Z��K�o����8@�ڝ��iQ|���TP�      5   H   x�-̻�0��Z&�ɟػx�9�X=�
)�t3�4˼f�c�P�H��J���~����{5v8�}2���      7   J   x�-���0C�3��A�x��?G���S�D����FP�Nd�m�������v�ǽj<�O5�{� �Y      8   �  x�%�ٮ�J D��_!9�2����	ݘ��43v������J���x�es6�|W)ጆߠbk]u�,`Hg/��[�9%�w/O��[N��5u����ۻƍy3^��j���8�*T�Y�b��Kۇӫ����H���a���~�y�x�p�L���=��'�3~|r�e���_�����x�i2e37�2�k��F�Ê�$Ժ+���xL��Ei*.c�U��E,��x���ֶ�
�r�cF��m��Oh�4�GC����*{?�o���5&�|۴R�`�,;/��:���0IA��cAO�
��uG��`�?������<i��p�Qt>�w���s�=�����V������S�Q�� J�B�W��| ���A��T	�?m�`_͜ոf3�}=o�*=L-dҋq�+?X�y�����&�l��[R�6,�]�-�}q�TE#��Za.�!L� �b��4һ��7ȢK�e�OD�P���RH�U�Fھ�x Tr���;�}�.n#Wu����v".^0�;��Q'C���dw��ǲ7�bK� ]?h�Wg��!k�Jt�X�l�֫�~Rᓆ"O`R	u����l��rt��ܨQg��;+ �:��Y�v�S���\�~�^G���9L�.�V�K֯�n�؟G�)ޘ�ם��Ba~G��~�P��rm=�&��V�����$���r�R8Ϫ��"���g�Sd��<�hK��CQ����      :      x�34�24�2��22����� �h      ;   ;   x�%ɻ  ��a |v�f����NǊ�k��8���[\��B,���Q�z'3{�{�      <   /   x���	  ��]1�FHL/�_�yL)܃��+�c�t�h�e��.�      =   �   x�e�An� E�p��[�:ؤ���1��R�qN����@�������]�@��2�����A��x�F�XeBmFĲ̪��ô:?�MF�*i6K	��M ����Y�]��sf��Au����`�%n�Bg�>VR^sr*��'�;��T�� ���AEN�W~
g��^����-�L��6�kZ�6r#�Cq^X|9���ֱ|o�k����p��6l�%`��`�`���|�(�?	~��      ?   2   x�3��M,��2���,.�/��2�t�K��,��2�t����O������ ��      @   :   x�%��  �e#m5����!��h�����b��rvx�+Q��/QC�4 �<
9     